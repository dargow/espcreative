local gis = {}
local timer
gis.player_settings = {}
local search_max = 128 --top of search column
local search_min = -127 --bottom of column

function gis.get_moving_window(scale) -- esri naming convention
	local neighborhood = {}
	neighborhood.a = {x= -scale,y=  0,z=  scale} -- NW
	neighborhood.b = {x=  0,	y=  0,z=  scale} -- N
	neighborhood.c = {x=  scale,y=  0,z=  scale} -- NE
	neighborhood.d = {x= -scale,y=  0,z=      0} -- W
	neighborhood.e = {x=  0,	y=  0,z=      0} -- SELF
	neighborhood.f = {x=  scale,y=  0,z=      0} -- E
	neighborhood.g = {x= -scale,y=  0,z= -scale} -- SW
	neighborhood.h = {x=  0,	y=  0,z= -scale} -- S
	neighborhood.i = {x=  scale,y=  0,z= -scale} -- SE
	return neighborhood
end
--registering node types for in-map results display
local colors = {}
for r=0, 15 do
	if r == 0 then r = '00' else r = string.format('%x', r * 17) end
	table.insert(colors, r..'00'..'00')
end
for g=1, 15 do
	g = string.format('%x', g * 17)
	table.insert(colors, '00'..g..'00')
end
for b=1, 15 do
	b = string.format('%x', b * 17)
	table.insert(colors, '00'..'00'..b)
end
for k, colorcode in next, colors do
	minetest.register_node(
		'gis:'..colorcode, {
			description = "GIS:"..colorcode,
			tiles = { colorcode..'.png' },
			light_source = 3,
			groups = {oddly_breakable_by_hand=1, gis=1},
			--[[after_place_node = function(pos, placer, itemstack, pointed_thing)
				local meta = minetest.get_meta(pos)
				meta:set_string("infotext", "Gis:"..colorcode);
				meta:set_int("placed", os.clock()*1000);
			end,--]]
	})	
end


-- the GPS tool
minetest.register_tool("gis:remote" , {
	description = "Image Trigger",
	inventory_image = "remote.png",
	groups = {not_in_creative_inventory=1},
	--left-clicking the tool
	on_use = function (itemstack, user, pointed_thing)
		local pname = user:get_player_name()
		minetest.chat_send_player(pname, "Please be patient as the map can take several seconds to load . . .")
		gis.show_mapform(pname)
	end,
})
function gis.show_mapform(pname)
		timer = os.clock()
		local player = minetest.get_player_by_name(pname)
		local tab = gis.get_player_setting(pname, "tab")
		local scale  = gis.get_player_setting(pname, "scale")
		if scale then scale = tonumber(string.sub(scale, 1, string.find(scale, ":") - 1))
		else scale = 1 end
		print("scale:" .. scale)
		if not tab then tab = "1" end
		gis.player_settings[pname] = {tab=tab}
		local pos = player:getpos()
		pos = {x=math.floor(pos.x+0.5), y=math.floor(pos.y+0.5), z=math.floor(pos.z+0.5)}
		local degree = player:get_look_yaw()*180/math.pi - 90
		if degree < 0 then degree = degree + 360 end
		local dir
		if     degree <= 45 or degree > 315 then dir = "+ Z"
		elseif degree <= 135 then dir = "- X"
		elseif degree <= 225 then dir = "- Z"
		else   dir = "+ X" end
		-- map draw variables
		local pixels, elmin, elmax, color
		local width = 65
		local height = 65
		local spec_space = 0.1
		local spec_left_m = 0
		local spec_top_m = 0.7
		local f_pixels = ""
		local i = 0
		--request the correct map based on tab
		if tab == "1" then --ELEVATION
			--f_pixels = "image[7,1;elev_legend.png]"
			pixels, elmin, elmax = gis.get_heightmap(pos, scale)
			for z, vals in next, pixels do
				z = z / scale
				for x, elev in next, vals do
					i = i + 1
					x = x / scale
					color = gis.contrast_stretch(elev, elmin, elmax, 15, "linear")
					local aboven = minetest.get_node({x=x*scale, y=elev+1, z=z*scale}).name
					local abovec = minetest.get_content_id(aboven)
					--if i  == 5 then print("x:"..x.." z:"..z.."blockabove name: "..aboven.." cid:"..abovec ) end
					color = string.format('%x', color * 17)
					if abovec == minetest.get_content_id("default:water_source")
						or abovec == minetest.get_content_id("default:water_flowing") then 
						color = "0000"..color
					else color = "00"..color.."00" end
					f_pixels = f_pixels .. "image["..( x - pos.x / scale + 32) * spec_space + spec_left_m..","..
								( z - pos.z / scale + 32) * spec_space + spec_top_m..";0.15,0.15;"..color..".png]"
					if i  == 5 then print(f_pixels) end
				end
			end
		elseif tab == "2" then -- SLOPE
			f_pixels = "image[7,1;slope_legend.png]"
			pixels, elmin, elmax = gis.get_heightmap(pos, scale)
			local slope_pixels = {}
			local slmin, slmax
			local i = 0
			for z, vals in next, pixels do
				for x, elev in next, vals do
					i = i + 1
					local neighbors = {}
					local edge_case = false
					for dir, offset in next, gis.get_moving_window(scale) do
						if pixels[z + offset.z] and pixels[z + offset.z][x + offset.x] then
							neighbors[dir] = pixels[z + offset.z][x + offset.x]
						else --edge case, need to abandon this pixel for slope
							edge_case = true
						end
					end
					if not edge_case then 
						if not slope_pixels[z] then slope_pixels[z] = {} end
						local slope = gis.get_slope({x=x,z=z}, neighbors)
						slope_pixels[z][x] = slope
						if not slmin then slmin = slope ; slmax = slope
						else
							if slope < slmin then slmin = slope end
							if slope > slmax then slmax = slope end
						end
					end
				end
			end
			local spread = slmax - slmin
			i = 0
			for z, vals in next, slope_pixels do
				z = z / scale
				for x, slope in next, vals do
					i = i + 1
					x = x / scale
					color = math.floor( (slope * 9 / spread ) + 0.5) + 1 -- contrast stretch
					color = string.format('%x', color * 17)
					color = color.."0000"
					--print("i = ".. i..", slope: "..slope..", color: "..color)
					f_pixels = f_pixels .. "image["..( x - pos.x / scale + 32) * spec_space + spec_left_m..","..
								( z - pos.z / scale + 32) * spec_space + spec_top_m..";0.15,0.15;"..color..".png]"
					--if i == 5 then print(f_pixels) end
				end
			end
		elseif tab == "3" then --ASPECT
			f_pixels = "image[7,1;aspect_legend.png]"
			pixels, elmin, elmax = gis.get_heightmap(pos, scale)
			local aspect_pixels = {}
			local asmin, asmax
			local i = 0
			for z, vals in next, pixels do
				z = z / scale
				for x, elev in next, vals do
					i = i + 1
					x = x / scale
					local neighbors = {}
					local edge_case = false
					for dir, offset in next, gis.get_moving_window(scale) do
						if pixels[z + offset.z] and pixels[z + offset.z][x + offset.x] then
							neighbors[dir] = pixels[z + offset.z][x + offset.x]
						else --edge case, need to abandon this pixel for aspect
							edge_case = true
						end
					end
					if not edge_case then 
						if not aspect_pixels[z] then aspect_pixels[z] = {} end
						local aspect = gis.get_aspect({x=x,z=z}, neighbors)
						aspect_pixels[z][x] = aspect
						if not asmin then asmin = aspect ; asmax = aspect
						else
							if aspect < asmin then asmin = aspect end
							if aspect > asmax then asmax = aspect end
						end
					end
				end
			end
			local slice = 22.5
			local color
			i = 0
			for z, vals in next, aspect_pixels do
				for x, aspect in next, vals do
					i = i + 1
					if aspect > 360 - slice or aspect <= slice then color = "0000ff"
					elseif aspect <= slice * 3 then color = "00ffff"
					elseif aspect <= slice * 5 then color = "009999"
					elseif aspect <= slice * 7 then color = "00ff00"
					elseif aspect <= slice * 9 then color = "009900"
					elseif aspect <= slice * 11 then color = "999900"
					elseif aspect <= slice * 13 then color = "ffff00"
					elseif aspect <= slice * 15 then color = "ff0000" end
					--print("i = ".. i..", aspect: "..aspect..", color: "..color)
					f_pixels = f_pixels .. "image["..( x - pos.x / scale + 32) * spec_space + spec_left_m..","..
								( z - pos.z / scale + 32) * spec_space + spec_top_m..";0.15,0.15;"..color..".png]"
					--if i == 5 then print(f_pixels) end
				end
			end
		elseif tab == "4" then --WATER
		elseif tab == "5" then --VEGETATION
		elseif tab == "6" then --MINERALS
		elseif tab == "7" then --HILLSHADE
			--print(dump(minetest.registered_nodes["water_flowing"]))
			f_pixels = "dropdown[7,2;1,1;sun;NW,N,NE,E,SE,S,SW,W;6]"
			pixels, elmin, elmax = gis.get_heightmap(pos, scale)
			local altitude = 45
			local azimuth = 135
			local zenith_rad = ( 90 - altitude ) * math.pi / 180.0
			local az_tmp = 360.0 - azimuth + 90
			if az_tmp >= 360.0 then az_tmp = az_tmp - 360.0 end
			local azimuth_rad = az_tmp * math.pi / 180.0
			local hill_pixels = {}
			local hillmin, hillmax
			local i = 0
			for z, vals in next, pixels do
				z = z / scale
				for x, elev in next, vals do
					i = i + 1
					x = x / scale
					local neighbors = {}
					local edge_case = false
					for dir, offset in next, gis.get_moving_window(scale) do
						if pixels[z + offset.z] and pixels[z + offset.z][x + offset.x] then
							neighbors[dir] = pixels[z + offset.z][x + offset.x]
						else --edge case, need to abandon this pixel for aspect
							edge_case = true
						end
					end
					if not edge_case then 
						local shade
						local  slope_rad = gis.get_slope( {x=x,z=z}, neighbors, true)
						local aspect_rad = gis.get_aspect({x=x,z=z}, neighbors, true)
						if not hill_pixels[z] then hill_pixels[z] = {} end
						shade = 255.0 * ((math.cos(zenith_rad) * math.cos(slope_rad)) +
						(math.sin(zenith_rad) * math.sin(slope_rad) * math.cos(azimuth_rad - aspect_rad)))
						hill_pixels[z][x] = shade
						--if i % 41 == 0 then print("zenrad: "..zenith_rad..", azirad: "..azimuth_rad..", slorad: "..slope_rad..", asprad: "..aspect_rad) end
						if not hillmin then hillmin = shade ; hillmax = shade
						else
							if shade < hillmin then hillmin = shade end
							if shade > hillmax then hillmax = shade end
						end
					end
				end
			end
			local color
			i = 0
			for z, vals in next, hill_pixels do
				for x, hill in next, vals do
					i = i + 1
					--@todo this contrast stretch might be a hack, hillshades should not be coming in
					--as negatives
					color = gis.contrast_stretch(hill, hillmin, hillmax, 15, "linear")
					color = string.format('%x', color * 17)
					if color == '0' then color = '00' end
					color = color..color..color
					f_pixels = f_pixels .. "image["..( x - pos.x / scale + 32) * spec_space + spec_left_m..","..
								( z - pos.z / scale + 32) * spec_space + spec_top_m..";0.15,0.15;"..color..".png]"
					--if i == 5 then print(f_pixels) end
				end
			end
		elseif tab == "8" then --CURVATURE
			f_pixels = "image[7,1;slope_legend.png]"
			pixels, elmin, elmax = gis.get_heightmap(pos, scale)
			local curve_pixels = {}
			local cumin, cumax
			local i = 0
			for z, vals in next, pixels do
				z = z / scale
				for x, elev in next, vals do
					i = i + 1
					x = x / scale
					local neighbors = {}
					local edge_case = false
					for dir, offset in next, gis.get_moving_window(scale) do
						if pixels[z + offset.z] and pixels[z + offset.z][x + offset.x] then
							neighbors[dir] = pixels[z + offset.z][x + offset.x]
						else --edge case, need to abandon this pixel for curve
							edge_case = true
						end
					end
					if not edge_case then 
						if not curve_pixels[z] then curve_pixels[z] = {} end
						local curve = gis.get_curve({x=x,z=z}, neighbors)
						curve_pixels[z][x] = curve
						if not cumin then cumin = curve ; cumax = curve
						else
							if curve < cumin then cumin = curve end
							if curve > cumax then cumax = curve end
						end
					end
				end
			end
			local spread = cumax - cumin
			i = 0
			for z, vals in next, curve_pixels do
				z = z / scale
				for x, curve in next, vals do
					i = i + 1
					x = x / scale
					if curve < -400 then color = 10
					elseif curve > 400 then color = 1
					elseif curve < -200 then color = 9
					elseif curve > 200 then color = 2
					elseif curve < -50 then color = 8
					elseif curve > 50 then color = 3
					elseif curve < -20 then color = 7
					elseif curve > 20 then color = 4
					elseif curve < -10 then color = 6
					else color = 5
					end
					--[[if i % 41 == 0 then 
					print("i = ".. i..", curve: "..curve..", color: "..color)
					print("cumin: "..cumin..", cumax: "..cumax..", spread: "..spread)
					end--]]
					f_pixels = f_pixels .. "image["..( x - pos.x / scale + 32) * spec_space + spec_left_m..","..
								( z - pos.z / scale + 32) * spec_space + spec_top_m..";0.15,0.15;slope"..color..".bmp]"
					--if i == 5 then print(f_pixels) end
				end
			end
		else return false end
		local scale = gis.get_player_setting(pname, "scale")
		if not scale then scale = "10:1" end
		
		local f_header = 	"size[10,7]"..
							"tabheader[0,0;tab;elev,slope,aspect,water,veg,mineral,hillshade,curve;"..tab.."]"..
							"label[0,0;You are at x= "..math.floor(pos.x)..
							" y= "..math.floor(pos.y).." z= "..math.floor(pos.z).." and mostly facing "..dir..
							"  (load time: ".. math.floor( (os.clock() - timer) * 1000 ) .. "ms)]"..
							"dropdown[7,1;1,1;scale;1:1,2:1,3:1,4:1,5:1;"..scale.."]"
		minetest.show_formspec(pname, "gis:mapform", f_header..f_pixels )
end
minetest.register_on_player_receive_fields(function(player, formname, fields)
	print("fields submitted: "..dump(fields))
	if string.sub(formname, 1, 4) == "gis:" and not fields.quit then
		local pname = player:get_player_name()
		-- recover the old tab to detect tab change later
		local old_tab = gis.get_player_setting(pname, "tab")
		-- always save any form fields
		for k,v in next, fields do
			gis.player_settings[pname][k] = v --we will preserve field entries exactly as entered 
		end
		print("psettings: "..dump(gis.player_settings[pname]))
		if formname == "gis:mapform" then
			if old_tab and fields.tab ~= old_tab then
				print("here")
				gis.show_mapform(pname)
				return true
			end
		end
	end
end)
--retrieve individual form field
function gis.get_player_setting(pname, setting)
	if gis.player_settings[pname] then
		if gis.player_settings[pname][setting] then
			if gis.player_settings[pname][setting] ~= "" then
				return gis.player_settings[pname][setting]
			else return false end
		else return false end
	else return false end
end
--contrast stretching for symbology
function gis.contrast_stretch(val, minval, maxval, levels, mode)
	local s = 0
	if minval < 0 and maxval > 0 then s = 1 end
	local spread = maxval - minval + s
	return ( math.floor((val - minval + s) / spread * (levels - 1) + 0.5) + 1 )
end
--initializing function for surface analysis
function gis.get_heightmap(pos, scale)
	print("heightmap scale: "..scale)
	local pmin, pmax = {}, {}
	pmin.x = pos.x - ( 32 * scale )
	pmin.y = pos.y
	pmin.z = pos.z - ( 32 * scale )
	pmax.x = pos.x + ( 32 * scale )
	pmax.y = pos.y
	pmax.z = pos.z + ( 32 * scale )
	local heightmap = {}
	local elmin, elmax
	local j = 0;
	for z = pmin.z, pmax.z, scale do
		j = j + 1
		local i = 0;
		heightmap[z] = {}
		for x = pmin.x, pmax.x, scale do
			i = i + 1
			local elev = gis.get_surface({x=x, y=search_max, z=z}, search_min, true)
			--if j == 17 and i < 17 then print(elev) end
			if elev then
				--if i == 1 and j == 1 then print("HERE") end
				heightmap[z][x] = elev
				if not elmin then elmin = elev; elmax = elev
				else
					if elev < elmin then elmin = elev end
					if elev > elmax then elmax = elev end
				end
			end
			--if j == 1 and i < 17 then print(dump(heightmap)) end
		end
	end
	return heightmap, elmin, elmax
end
-- scan a column from the top down looking for first contact 
function gis.get_surface(coltopp, colboty, walkable_only)
	local colx = coltopp.x
	local colz = coltopp.z
	local coltopy = coltopp.y
	local noden = minetest.get_node(coltopp).name
	local runposy = coltopy
	local function is_walkable(name)
		local data = minetest.registered_nodes[name]
		return data and data.walkable ~= false
	end
	local function is_solid(name)
		if name ~= "air" and name ~= "ignore" then --@todo should also include trees in this
			return true 
		else return false end
	end
	--test the column top to see if we need to loop at all
	if walkable_only then
		if is_walkable(noden) then return coltopy end
	else
		if is_solid(noden) then return coltopy end
	end
	while runposy >= colboty do
		runposy = runposy - 1
		noden = minetest.get_node({x=colx, y=runposy, z=colz}).name
		if (walkable_only) then
			if is_walkable(noden) then return runposy, noden end
		else
			if is_solid(noden) then return runposy, noden end
		end
	end
	return false --no surface in column
end
-- http://resources.arcgis.com/en/help/main/10.1/index.html#/How_Slope_works/009z000000vz000000/
function gis.get_slope(pos, n, rad)
	local x_cellsize, z_cellsize = 1, 1
	local rise_xrun = ((n.c + 2 * n.f + n.i) - (n.a + 2 * n.d + n.g)) / (8 * x_cellsize)
	local rise_zrun = ((n.g + 2 * n.h + n.i) - (n.a + 2 * n.b + n.c)) / (8 * z_cellsize)
	local rise_xzrun = math.sqrt( rise_xrun ^ 2 + rise_zrun ^ 2 )
	if rad then return rise_xzrun end
	local degrees = math.atan(rise_xzrun) * 180 / math.pi
	return math.floor(degrees + 0.5)
end
-- http://resources.arcgis.com/en/help/main/10.1/index.html#/How_Curvature_works/009z000000vs000000/
function gis.get_curve(pos, n)
	local curve
	--[[local A,B,C,D,E,F,G,H,I --terms for polynomial
	A = ((n.a + n.c + n.g + n.i) / 4  - (n.b + n.d + n.f + n.h) / 2 + n.e) -- / L^4 (cell size)
	B = ((n.a + n.c - n.g - n.i) /4 - (n.b - n.h) /2) -- / L^3
	C = ((-n.a + n.c - n.g + n.i) /4 + (n.d - n.f) /2) -- / L^3--]]
	local D = ((n.d + n.f) /2 - n.e) -- / L^2
	local E = ((n.b + n.h) /2 - n.e) -- / L^2
	--[[F = (-n.a + n.c + n.g - n.i) -- / 4L^2
	G = (-n.d + n.f) -- / 2^L
	H = (n.b - n.h) -- / 2^L
	I = n.e--]]
	curve = -2*(D + E) -- * 100
	return curve
end
-- http://resources.arcgis.com/en/help/main/10.1/index.html#/How_Aspect_works/009z000000vp000000/
function gis.get_aspect(pos, n, rad)
	local rise_xrun = ((n.c + 2 * n.f + n.i) - (n.a + 2 * n.d + n.g)) / 8
	local rise_zrun = ((n.g + 2 * n.h + n.i) - (n.a + 2 * n.b + n.c)) / 8
	local aspect
	if rise_xrun ~= 0 then 
		aspect = math.atan2(rise_zrun, - rise_xrun) * 180 / math.pi 
		if aspect < 0 then aspect = 2 * math.pi + aspect end
	else 
		if rise_zrun > 0 then aspect = math.pi / 2 
		elseif rise_zrun < 0 then aspect = 2 * math.pi - (math.pi/2)
		else aspect = 0 -- @todo not sure if this is actually 0
		end
	end
	if rad then return aspect 
	else	
		local cell
		if aspect < 0 then cell = 90.0 - aspect
		elseif aspect > 90.0 then
			cell = 360.0 - aspect + 90.0
		else
			cell = 90.0 - aspect
		end
		return math.floor(cell + 0.5)
	end
end

-- if WorldEdit is installed then this chat command can convert all dirt into slope-symbolized blocks
minetest.register_chatcommand("/slope", {
	params = "",
	description = "turn all dirt blocks into slope symbology",
	privs = {worldedit=true},
	func = function(name, param)
		local pos1, pos2 = worldedit.pos1[name], worldedit.pos2[name]
		--for each automata:inactive block found in the area, if it is not owned by a
		--player in the game then it will load it into the automata.inactive table
		if pos1 == nil or pos2 == nil then
			minetest.chat_send_player(name, "No worldedit region selected!")
		else
			--identify the pmin and pmax from pos1 and pos2
			pos1, pos2 = worldedit.sort_pos(pos1, pos2)
			
			--find the surface for the entire area, whether inside the region or not, only x-z matter
			--calculate slope for each surface block and then convert the block to symbology
			for z=pos1.z, pos2.z do
				for x=pos1.x, pos2.x do
					--get elevation
					local elev = gis.get_surface({x=x, y=search_max, z=z}, search_min, true)
					--get elevation of neighbors
					local neighbors = {}
					for dir, offset in next, gis.get_moving_window(1) do
						neighbors[dir] = gis.get_surface({x=x + offset.x, y=search_max, z=z + offset.z}, search_min, true)
					end
					--get slope
					local slope = gis.get_slope(pos, neighbors)
					--replace block with symbology
					local color = math.floor( (slope / 16) + 0.5) -- contrast stretch?
					if color == 0 then color = '00' else color = string.format('%x', color * 17) end
					color = color.."0000"
					print(slope..":"..color)
					minetest.set_node({x=x, y=elev, z=z}, {name="gis:"..color})
				end				
			end
			
			minetest.chat_send_player(name, "slope symbolized in selected region")
			return true
		end
		return false
	end,
})

local gis = {}
local timer
gis.player_settings = {}
local search_max = 128 --top of search column
local search_min = -127 --bottom of column

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
	minetest.register_alias("gis:"..colorcode, "air")
--	minetest.register_node(
--		'gis:'..colorcode, {
--			description = "GIS:"..colorcode,
--			tiles = { colorcode..'.png' },
--			light_source = 3,
--			groups = {oddly_breakable_by_hand=1, gis=1},
			--[[after_place_node = function(pos, placer, itemstack, pointed_thing)
				local meta = minetest.get_meta(pos)
				meta:set_string("infotext", "Gis:"..colorcode);
				meta:set_int("placed", os.clock()*1000);
			end,--]]
--	})	
end


-- the GPS tool



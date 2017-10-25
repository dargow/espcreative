minetest.register_node( "birthstones:alexandriteblock", {
	description = "Alexandrite Block",
	tile_images = { "Alexandrite_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:amethystblock", {
	description = "Amethyst Block",
	tile_images = { "Amethyst_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:aquamarineblock", {
	description = "Aquamarine Block",
	tile_images = { "Aquamarine_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:diamondblock", {
	description = "Diamond Block",
	tile_images = { "Diamond_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:emeraldblock", {
	description = "Emerald Block",
	tile_images = { "Emerald_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:garnetblock", {
	description = "Garnet Block",
	tile_images = { "Garnet_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:opalblock", {
	description = "Opal Block",
	tile_images = { "Opal_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:peridotblock", {
	description = "Peridot Block",
	tile_images = { "Peridot_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:rubyblock", {
	description = "Ruby Block",
	tile_images = { "Ruby_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:sapphireblock", {
	description = "Sapphire Block",
	tile_images = { "Sapphire_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:topazblock", {
	description = "Topaz Block",
	tile_images = { "Topaz_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node( "birthstones:zirconblock", {
	description = "Zircon Block",
	tile_images = { "Zircon_block.png" },
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})


local function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, ore_per_chunk, height_min, height_max)
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x-minp.x+1)*(y_max-y_min+1)*(maxp.z-minp.z+1)
	local pr = PseudoRandom(seed)
	local num_chunks = math.floor(chunks_per_volume * volume)
	local chunk_size = 3
	if ore_per_chunk <= 4 then
		chunk_size = 2
	end
	local inverse_chance = math.floor(chunk_size*chunk_size*chunk_size / ore_per_chunk)
	--print("generate_ore num_chunks: "..dump(num_chunks))
	for i=1,num_chunks do
		local y0 = pr:next(y_min, y_max-chunk_size+1)
		if y0 >= height_min and y0 <= height_max then
			local x0 = pr:next(minp.x, maxp.x-chunk_size+1)
			local z0 = pr:next(minp.z, maxp.z-chunk_size+1)
			local p0 = {x=x0, y=y0, z=z0}
			for x1=0,chunk_size-1 do
			for y1=0,chunk_size-1 do
			for z1=0,chunk_size-1 do
				if pr:next(1,inverse_chance) == 1 then
					local x2 = x0+x1
					local y2 = y0+y1
					local z2 = z0+z1
					local p2 = {x=x2, y=y2, z=z2}
					if minetest.env:get_node(p2).name == wherein then
						minetest.env:set_node(p2, {name=name})
					end
				end
			end
			end
			end
		end
	end
end

minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:alexandriteore", "default:stone", minp, maxp, seed+21,   1/10/10/10,    4, -31000,  -40)
end)
minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:amethystore", "default:stone", minp, maxp, seed+31,   1/10/10/10,    4, -31000,  -50)
end)
minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:aquamarineore", "default:stone", minp, maxp, seed+41,   1/10/10/10,    4, -31000,  -10)
end)
minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:diamondore", "default:stone", minp, maxp, seed+51,   1/10/10/10,    1, -31000,  -300)
end)
minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:emeraldore", "default:stone", minp, maxp, seed+61,   1/10/10/10,    3, -31000,  -100)
end)
minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:garnetore", "default:stone", minp, maxp, seed+71,   1/10/10/10,    4, -31000,  -70)
end)
minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:peridotore", "default:stone", minp, maxp, seed+81,   1/10/10/10,    4, -31000,  -60)
end)
minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:rubyore", "default:stone", minp, maxp, seed+91,   1/10/10/10,    3, -31000,  -120)
end)
minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:sapphireore", "default:stone", minp, maxp, seed+101,   1/10/10/10,    3, -31000,  -120)
end)
minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:topazore", "default:stone", minp, maxp, seed+111,   1/10/10/10,    4, -31000,  -80)
end)
minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("birthstones:zirconore", "default:stone", minp, maxp, seed+121,   1/10/10/10,    4, -31000,  -70)
end)

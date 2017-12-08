minetest.register_node("xtraores:stone_with_platinum", {
	description = "platinum ore",
	tiles = {"default_stone.png^xtraores_mineral_platinum.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'xtraores:platinum_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("xtraores:platinum_brick", {
	description = "platinum bricks",
	tiles = {"xtraores_platinum_brick.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_platinum",
	wherein        = "default:stone",
	clust_scarcity = 7*7*7,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -100,
	flags          = "absheight",
})
minetest.register_node("xtraores:stone_with_cobalt", {
	description = "cobalt ore",
	tiles = {"default_stone.png^xtraores_mineral_cobalt.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = 'xtraores:cobalt_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("xtraores:cobalt_brick", {
	description = "cobalt bricks",
	tiles = {"xtraores_cobalt_brick.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_cobalt",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -650,
	flags          = "absheight",
})
minetest.register_node("xtraores:stone_with_osminum", {
	description = "osminum ore",
	tiles = {"default_stone.png^xtraores_mineral_osminum.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = 'xtraores:osminum_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("xtraores:osminum_brick", {
	description = "osminum bricks",
	tiles = {"xtraores_osminum_brick.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_osminum",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -1000,
	flags          = "absheight",
})
minetest.register_node("xtraores:stone_with_adamantite", {
	description = "adamantite ore",
	tiles = {"default_stone.png^xtraores_mineral_adamantite.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = 'xtraores:adamantite_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("xtraores:adamantite_brick", {
	description = "adamantite bricks",
	tiles = {"xtraores_adamantite_brick.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_adamantite",
	wherein        = "default:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -2000,
	flags          = "absheight",
})
minetest.register_node("xtraores:stone_with_rarium", {
	description = "rarium ore",
	tiles = {"default_stone.png^xtraores_mineral_rarium.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = 'xtraores:rarium_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("xtraores:rarium_brick", {
	description = "rarium bricks",
	tiles = {"xtraores_rarium_brick.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_rarium",
	wherein        = "default:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -5000,
	flags          = "absheight",
})
minetest.register_node("xtraores:stone_with_unobtanium", {
	description = "unobtanium ore",
	tiles = {"default_stone.png^xtraores_mineral_unobtanium.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = 'xtraores:unobtanium_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("xtraores:unobtanium_brick", {
	description = "unobtanium bricks",
	tiles = {"xtraores_unobtanium_brick.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_unobtanium",
	wherein        = "default:stone",
	clust_scarcity = 30*30*30,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -31000,
	y_max     = -10000,
	flags          = "absheight",
})

minetest.register_node("xtraores:rainbow", {
	description = "rainbow block",
	tiles = {"xtraores_rainbow_block.png"},
	light_source = default.LIGHT_MAX - 1,
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})



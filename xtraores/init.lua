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
minetest.register_craftitem("xtraores:platinum_lump", {
	description = "platinum lump",
	inventory_image = "xtraores_platinum_lump.png",
})
minetest.register_craftitem("xtraores:platinum_bar", {
	description = "platinum bar",
	inventory_image = "xtraores_platinum_bar.png",
})
minetest.register_craft({
	type = "cooking",
	output = "xtraores:platinum_bar",
	recipe = "xtraores:platinum_lump",
})
minetest.register_craft({
	output = 'xtraores:platinum_brick',
	recipe = {
		{'xtraores:platinum_lump'},
		{'default:cobble'},
	}
})
minetest.register_tool("xtraores:pick_platinum", {
	description = "platinum pickaxe",
	inventory_image = "xtraores_pick_platinum.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=2.4, [2]=1.2, [3]=0.60}, uses=15, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})
minetest.register_tool("xtraores:shovel_platinum", {
	description = "platinum shovel",
	inventory_image = "xtraores_shovel_platinum.png",
	wield_image = "xtraores_shovel_platinum.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=15, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})
minetest.register_tool("xtraores:axe_platinum", {
	description = "platinum axe",
	inventory_image = "xtraores_axe_platinum.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.20, [2]=1.00, [3]=0.60}, uses=15, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
})
minetest.register_tool("xtraores:sword_platinum", {
	description = "platinum sword",
	inventory_image = "xtraores_sword_platinum.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	}
})
minetest.register_craft({
	output = 'xtraores:pick_platinum',
	recipe = {
		{'xtraores:platinum_bar', 'xtraores:platinum_bar', 'xtraores:platinum_bar'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})
minetest.register_craft({
	output = 'xtraores:shovel_platinum',
	recipe = {
		{'xtraores:platinum_bar'},
		{'group:stick'},
		{'group:stick'},
	}
})
minetest.register_craft({
	output = 'xtraores:axe_platinum',
	recipe = {
		{'xtraores:platinum_bar', 'xtraores:platinum_bar'},
		{'xtraores:platinum_bar', 'group:stick'},
		{'', 'group:stick'},
	}
})
minetest.register_craft({
	output = 'xtraores:sword_platinum',
	recipe = {
		{'xtraores:platinum_bar'},
		{'xtraores:platinum_bar'},
		{'group:stick'},
	}
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_platinum",
	wherein        = "default:stone",
	clust_scarcity = 7*7*7,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -100,
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
minetest.register_craftitem("xtraores:cobalt_lump", {
	description = "cobalt lump",
	inventory_image = "xtraores_cobalt_lump.png",
})
minetest.register_craftitem("xtraores:cobalt_bar", {
	description = "cobalt bar",
	inventory_image = "xtraores_cobalt_bar.png",
})
minetest.register_craft({
	type = "cooking",
	output = "xtraores:cobalt_bar",
	recipe = "xtraores:cobalt_lump",
})
minetest.register_craft({
	output = 'xtraores:cobalt_brick',
	recipe = {
		{'xtraores:cobalt_lump'},
		{'default:cobble'},
	}
})
minetest.register_tool("xtraores:pick_cobalt", {
	description = "cobalt warpick",
	inventory_image = "xtraores_pick_cobalt.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.5, [2]=0.85, [3]=0.40}, uses=60, maxlevel=3},
			weryhard = {times={[3]=3.00}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
})
minetest.register_tool("xtraores:shovel_cobalt", {
	description = "cobalt shovel",
	inventory_image = "xtraores_shovel_cobalt.png",
	wield_image = "xtraores_shovel_cobalt.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=0.90, [2]=0.40, [3]=0.20}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
})
minetest.register_tool("xtraores:axe_cobalt", {
	description = "cobalt waraxe",
	inventory_image = "xtraores_axe_cobalt.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.80, [2]=0.70, [3]=0.30}, uses=60, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
})
minetest.register_tool("xtraores:sword_cobalt", {
	description = "cobalt cutlas",
	inventory_image = "xtraores_sword_cobalt.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.50, [2]=0.70, [3]=0.20}, uses=70, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	}
})
minetest.register_craft({
	output = 'xtraores:pick_cobalt',
	recipe = {
		{'xtraores:cobalt_bar', 'xtraores:cobalt_bar', 'xtraores:cobalt_bar'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})
minetest.register_craft({
	output = 'xtraores:shovel_cobalt',
	recipe = {
		{'xtraores:cobalt_bar'},
		{'group:stick'},
		{'group:stick'},
	}
})
minetest.register_craft({
	output = 'xtraores:axe_cobalt',
	recipe = {
		{'xtraores:cobalt_bar', 'xtraores:cobalt_bar'},
		{'xtraores:cobalt_bar', 'group:stick'},
		{'', 'group:stick'},
	}
})
minetest.register_craft({
	output = 'xtraores:sword_cobalt',
	recipe = {
		{'xtraores:cobalt_bar'},
		{'xtraores:cobalt_bar'},
		{'group:stick'},
	}
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_cobalt",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -650,
	flags          = "absheight",
})
minetest.register_node("xtraores:stone_with_osminum", {
	description = "osminum ore",
	tiles = {"default_stone.png^xtraores_mineral_osminum.png"},
	is_ground_content = true,
	groups = {weryhard=3},
	drop = 'xtraores:osminum_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("xtraores:osminum_brick", {
	description = "osminum bricks",
	tiles = {"xtraores_osminum_brick.png"},
	is_ground_content = true,
	groups = {weryhard=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craftitem("xtraores:osminum_lump", {
	description = "osminum lump",
	inventory_image = "xtraores_osminum_lump.png",
})
minetest.register_craftitem("xtraores:osminum_bar", {
	description = "osminum bar",
	inventory_image = "xtraores_osminum_bar.png",
})
minetest.register_craft({
	type = "cooking",
	output = "xtraores:osminum_bar",
	recipe = "xtraores:osminum_lump",
})
minetest.register_craft({
	output = 'xtraores:osminum_brick',
	recipe = {
		{'xtraores:osminum_lump'},
		{'default:cobble'},
	}
})
minetest.register_tool("xtraores:pick_osminum", {
	description = "osminum warpick",
	inventory_image = "xtraores_pick_osminum.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.2, [2]=0.70, [3]=0.30}, uses=100, maxlevel=3},
			weryhard = {times={[3]=2.00, [2]=3.00}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=13},
	},
})
minetest.register_tool("xtraores:shovel_osminum", {
	description = "osminum shovel",
	inventory_image = "xtraores_shovel_osminum.png",
	wield_image = "xtraores_shovel_osminum.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=0.60, [2]=0.25, [3]=0.15}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=12},
	},
})
minetest.register_tool("xtraores:axe_osminum", {
	description = "osminum greataxe",
	inventory_image = "xtraores_axe_osminum.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.20, [2]=0.40, [3]=0.15}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=14},
	},
})
minetest.register_tool("xtraores:sword_osminum", {
	description = "osminum greatsword",
	inventory_image = "xtraores_sword_osminum.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.0, [2]=0.40, [3]=0.10}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=15},
	}
})
minetest.register_craft({
	output = 'xtraores:pick_osminum',
	recipe = {
		{'xtraores:osminum_bar', 'xtraores:osminum_bar', 'xtraores:osminum_bar'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})
minetest.register_craft({
	output = 'xtraores:shovel_osminum',
	recipe = {
		{'xtraores:osminum_bar'},
		{'group:stick'},
		{'group:stick'},
	}
})
minetest.register_craft({
	output = 'xtraores:axe_osminum',
	recipe = {
		{'xtraores:osminum_bar', 'xtraores:osminum_bar'},
		{'xtraores:osminum_bar', 'group:stick'},
		{'', 'group:stick'},
	}
})
minetest.register_craft({
	output = 'xtraores:sword_osminum',
	recipe = {
		{'xtraores:osminum_bar'},
		{'xtraores:osminum_bar'},
		{'group:stick'},
	}
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_osminum",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -1000,
	flags          = "absheight",
})
minetest.register_node("xtraores:stone_with_adamantite", {
	description = "adamantite ore",
	tiles = {"default_stone.png^xtraores_mineral_adamantite.png"},
	is_ground_content = true,
	groups = {weryhard=2},
	drop = 'xtraores:adamantite_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("xtraores:adamantite_brick", {
	description = "adamantite bricks",
	tiles = {"xtraores_adamantite_brick.png"},
	is_ground_content = true,
	groups = {weryhard=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craftitem("xtraores:adamantite_lump", {
	description = "adamantite lump",
	inventory_image = "xtraores_adamantite_lump.png",
})
minetest.register_craftitem("xtraores:adamantite_bar", {
	description = "adamantite bar",
	inventory_image = "xtraores_adamantite_bar.png",
})
minetest.register_craft({
	type = "cooking",
	output = "xtraores:adamantite_bar",
	recipe = "xtraores:adamantite_lump",
})
minetest.register_craft({
	output = 'xtraores:adamantite_brick',
	recipe = {
		{'xtraores:adamantite_lump'},
		{'default:cobble'},
	}
})
minetest.register_tool("xtraores:pick_adamantite", {
	description = "adamantite breaker",
	inventory_image = "xtraores_pick_adamantite.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=0.6, [2]=0.35, [3]=0.15}, uses=200, maxlevel=3},
			weryhard = {times={[3]=1.00, [2]=2.00, [1]=3.00}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=18},
	},
})
minetest.register_tool("xtraores:shovel_adamantite", {
	description = "adamantite shovel",
	inventory_image = "xtraores_shovel_adamantite.png",
	wield_image = "xtraores_shovel_adamantite.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=0.30, [2]=0.125, [3]=0.075}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=17},
	},
})
minetest.register_tool("xtraores:axe_adamantite", {
	description = "adamantite chainsaw",
	inventory_image = "xtraores_axe_adamantite.png",
	tool_capabilities = {
		full_punch_interval = 0.001,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.40, [2]=0.10, [3]=0.03}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
})
minetest.register_tool("xtraores:sword_adamantite", {
	description = "adamantite katana",
	inventory_image = "xtraores_sword_adamantite.png",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.5, [2]=0.20, [3]=0.05}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=20},
	}
})
minetest.register_craft({
	output = 'xtraores:pick_adamantite',
	recipe = {
		{'xtraores:adamantite_bar', 'xtraores:adamantite_bar', 'xtraores:adamantite_bar'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})
minetest.register_craft({
	output = 'xtraores:shovel_adamantite',
	recipe = {
		{'xtraores:adamantite_bar'},
		{'group:stick'},
		{'group:stick'},
	}
})
minetest.register_craft({
	output = 'xtraores:axe_adamantite',
	recipe = {
		{'default:steel_ingot', 'xtraores:adamantite_bar'},
		{'default:steel_ingot', 'xtraores:adamantite_bar'},
		{'', 'xtraores:adamantite_bar'},
	}
})
minetest.register_craft({
	output = 'xtraores:sword_adamantite',
	recipe = {
		{'xtraores:adamantite_bar'},
		{'xtraores:adamantite_bar'},
		{'group:stick'},
	}
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_adamantite",
	wherein        = "default:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -2000,
	flags          = "absheight",
})
minetest.register_node("xtraores:stone_with_rarium", {
	description = "rarium ore",
	tiles = {"default_stone.png^xtraores_mineral_rarium.png"},
	is_ground_content = true,
	groups = {weryhard=1},
	drop = 'xtraores:rarium_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("xtraores:rarium_brick", {
	description = "rarium bricks",
	tiles = {"xtraores_rarium_brick.png"},
	is_ground_content = true,
	groups = {weryhard=1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craftitem("xtraores:rarium_lump", {
	description = "rarium lump",
	inventory_image = "xtraores_rarium_lump.png",
})
minetest.register_craftitem("xtraores:rarium_bar", {
	description = "rarium bar",
	inventory_image = "xtraores_rarium_bar.png",
})
minetest.register_craft({
	type = "cooking",
	output = "xtraores:rarium_bar",
	recipe = "xtraores:rarium_lump",
})
minetest.register_craft({
	output = 'xtraores:rarium_brick',
	recipe = {
		{'xtraores:rarium_lump'},
		{'default:cobble'},
	}
})
minetest.register_tool("xtraores:drill_rarium", {
	description = "rarium drill",
	inventory_image = "xtraores_drill_rarium.png",
	tool_capabilities = {
		full_punch_interval = 0.001,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=0.3, [2]=0.125, [3]=0.075}, uses=350, maxlevel=3},
			weryhard = {times={[3]=0.50, [2]=1.00, [1]=1.50, [0]=2.00}, uses=350, maxlevel=3},
			crumbly = {times={[1]=0.15, [2]=0.06, [3]=0.03}, uses=350, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
})
minetest.register_tool("xtraores:axe_rarium", {
	description = "rarium chainsaw",
	inventory_image = "xtraores_axe_rarium.png",
	tool_capabilities = {
		full_punch_interval = 0.001,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.20, [2]=0.05, [3]=0.015}, uses=350, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
})
minetest.register_tool("xtraores:sword_rarium", {
	description = "rarium slicer",
	inventory_image = "xtraores_sword_rarium.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.25, [2]=0.10, [3]=0.025}, uses=350, maxlevel=3},
		},
		damage_groups = {fleshy=30},
	}
})
minetest.register_craft({
	output = 'xtraores:drill_rarium',
	recipe = {
		{'xtraores:rarium_bar', 'xtraores:rarium_bar', 'xtraores:rarium_bar'},
		{'', 'xtraores:rarium_bar', ''},
		{'', 'default:diamond', ''},
	}
})
minetest.register_craft({
	output = 'xtraores:axe_rarium',
	recipe = {
		{'default:steel_ingot', 'xtraores:rarium_bar'},
		{'default:steel_ingot', 'xtraores:rarium_bar'},
		{'', 'xtraores:rarium_bar'},
	}
})
minetest.register_craft({
	output = 'xtraores:sword_rarium',
	recipe = {
		{'xtraores:rarium_bar'},
		{'xtraores:rarium_bar'},
		{'group:stick'},
	}
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_rarium",
	wherein        = "default:stone",
	clust_scarcity = 25*25*25,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -5000,
	flags          = "absheight",
})
minetest.register_node("xtraores:stone_with_unobtanium", {
	description = "unobtanium ore",
	tiles = {"default_stone.png^xtraores_mineral_unobtanium.png"},
	is_ground_content = true,
	groups = {weryhard=0},
	drop = 'xtraores:unobtanium_lump',
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("xtraores:unobtanium_brick", {
	description = "unobtanium bricks",
	tiles = {"xtraores_unobtanium_brick.png"},
	is_ground_content = true,
	groups = {weryhard=0},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craftitem("xtraores:unobtanium_lump", {
	description = "unobtanium lump",
	inventory_image = "xtraores_unobtanium_lump.png",
})
minetest.register_craftitem("xtraores:unobtanium_bar", {
	description = "unobtanium bar",
	inventory_image = "xtraores_unobtanium_bar.png",
})
minetest.register_craft({
	type = "cooking",
	output = "xtraores:unobtanium_bar",
	recipe = "xtraores:unobtanium_lump",
})
minetest.register_craft({
	output = 'xtraores:unobtanium_brick',
	recipe = {
		{'xtraores:unobtanium_lump'},
		{'default:cobble'},
	}
})
minetest.register_tool("xtraores:drill_unobtanium", {
	description = "unobtanium drill",
	inventory_image = "xtraores_drill_unobtanium.png",
	tool_capabilities = {
		full_punch_interval = 0.001,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=0.15, [2]=0.06, [3]=0.04}, uses=500, maxlevel=3},
			weryhard = {times={[3]=0.25, [2]=0.50, [1]=0.75, [0]=1.00}, uses=500, maxlevel=3},
			crumbly = {times={[1]=0.15, [2]=0.06, [3]=0.03}, uses=500, maxlevel=3},
		},
		damage_groups = {fleshy=12},
	},
})
minetest.register_tool("xtraores:axe_unobtanium", {
	description = "unobtanium chainsaw",
	inventory_image = "xtraores_axe_unobtanium.png",
	tool_capabilities = {
		full_punch_interval = 0.001,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=0.10, [2]=0.025, [3]=0.0075}, uses=500, maxlevel=3},
		},
		damage_groups = {fleshy=12},
	},
})
minetest.register_tool("xtraores:sword_unobtanium", {
	description = "unobtanium darkness",
	inventory_image = "xtraores_sword_unobtanium.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.0125, [2]=0.05, [3]=0.006}, uses=500, maxlevel=3},
		},
		damage_groups = {fleshy=35},
	}
})
minetest.register_craft({
	output = 'xtraores:drill_unobtanium',
	recipe = {
		{'xtraores:unobtanium_bar', 'xtraores:unobtanium_bar', 'xtraores:unobtanium_bar'},
		{'', 'xtraores:unobtanium_bar', ''},
		{'', 'default:diamond', ''},
	}
})
minetest.register_craft({
	output = 'xtraores:axe_unobtanium',
	recipe = {
		{'default:steel_ingot', 'xtraores:unobtanium_bar'},
		{'default:steel_ingot', 'xtraores:unobtanium_bar'},
		{'', 'xtraores:rarium_bar'},
	}
})
minetest.register_craft({
	output = 'xtraores:sword_unobtanium',
	recipe = {
		{'xtraores:unobtanium_bar'},
		{'xtraores:unobtanium_bar'},
		{'group:stick'},
	}
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "xtraores:stone_with_unobtanium",
	wherein        = "default:stone",
	clust_scarcity = 30*30*30,
	clust_num_ores = 5,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -10000,
	flags          = "absheight",
})
minetest.register_tool("xtraores:sword_excalibur", {
	description = "excalibur(HAS 75 DAMAGE THAT IS SO OP!!! so as its recipe...) ",
	inventory_image = "xtraores_sword_excalibur.png",
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.0125, [2]=0.05, [3]=0.006}, uses=500, maxlevel=3},
		},
		damage_groups = {fleshy=75},
	}
})
minetest.register_craft({
	output = 'xtraores:sword_excalibur',
	recipe = {
		{'xtraores:sword_osminum', 'xtraores:sword_adamantite', 'xtraores:sword_rarium'},
		{'xtraores:sword_cobalt', 'default:sword_diamond', 'xtraores:sword_unobtanium'},
		{'default:diamondblock', 'default:mese', 'default:diamondblock'},
	}
})
minetest.register_node("xtraores:rainbow", {
	description = "rainbow block",
	tiles = {"xtraores_rainbow_block.png"},
	light_source = default.LIGHT_MAX - 1,
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craft({
	output = 'xtraores:rainbow 10',
	recipe = {
		{'xtraores:adamantite_bar', 'xtraores:rarium_bar', 'xtraores:platinum_bar'},
		{'xtraores:cobalt_bar', 'default:glass', 'xtraores:osminum_bar'},
		{'default:diamond', 'default:mese_crystal', 'default:copper_ingot'},
	}
})
minetest.register_tool("xtraores:spear_platinum", {
	description = "platinum spear",
	inventory_image = "xtraores_spear_platinum.png",
	range = 12,
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	}
})
minetest.register_craft({
	output = 'xtraores:spear_platinum',
	recipe = {
		{'', 'xtraores:platinum_bar', 'xtraores:platinum_bar'},
		{'', 'group:stick', 'xtraores:platinum_bar'},
		{'group:stick', '', ''},
	}
})
minetest.register_tool("xtraores:spear_cobalt", {
	description = "cobalt spear",
	inventory_image = "xtraores_spear_cobalt.png",
	range = 12,
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	}
})
minetest.register_craft({
	output = 'xtraores:spear_cobalt',
	recipe = {
		{'', 'xtraores:cobalt_bar', 'xtraores:cobalt_bar'},
		{'', 'group:stick', 'xtraores:cobalt_bar'},
		{'group:stick', '', ''},
	}
})
minetest.register_tool("xtraores:spear_osminum", {
	description = "osminum spear",
	inventory_image = "xtraores_spear_osminum.png",
	range = 12,
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3},
		},
		damage_groups = {fleshy=15},
	}
})
minetest.register_craft({
	output = 'xtraores:spear_osminum',
	recipe = {
		{'', 'xtraores:osminum_bar', 'xtraores:osminum_bar'},
		{'', 'group:stick', 'xtraores:osminum_bar'},
		{'group:stick', '', ''},
	}
})
minetest.register_tool("xtraores:spear_adamantite", {
	description = "adamantite spear",
	inventory_image = "xtraores_spear_adamantite.png",
	range = 12,
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3},
		},
		damage_groups = {fleshy=30},
	}
})
minetest.register_craft({
	output = 'xtraores:spear_adamantite',
	recipe = {
		{'', 'xtraores:adamantite_bar', 'xtraores:adamantite_bar'},
		{'', 'group:stick', 'xtraores:adamantite_bar'},
		{'group:stick', '', ''},
	}
})

minetest.register_tool("xtraores:spear_rarium", {
	description = "rarium spear",
	inventory_image = "xtraores_spear_rarium.png",
	range = 12,
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3},
		},
		damage_groups = {fleshy=30},
	}
})
minetest.register_craft({
	output = 'xtraores:spear_rarium',
	recipe = {
		{'', 'xtraores:rarium_bar', 'xtraores:rarium_bar'},
		{'', 'group:stick', 'xtraores:rarium_bar'},
		{'group:stick', '', ''},
	}
})
minetest.register_tool("xtraores:spear_unobtanium", {
	description = "unobtanium spear",
	inventory_image = "xtraores_spear_unobtanium.png",
	range = 12,
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=23, maxlevel=3},
		},
		damage_groups = {fleshy=35},
	}
})
minetest.register_craft({
	output = 'xtraores:spear_unobtanium',
	recipe = {
		{'', 'xtraores:unobtanium_bar', 'xtraores:unobtanium_bar'},
		{'', 'group:stick', 'xtraores:unobtanium_bar'},
		{'group:stick', '', ''},
	}
})




-- Minetest 0.4 Mod: Nether

local NETHER_DEPTH = -5000

minetest.register_node("nether:rack", {
	description = "Netherrack",
	tiles = {"nether_rack.png"},
	is_ground_content = true,
	drop = {
		max_items = 1,
		items = {{
			rarity = 3,
			items = {"nether:rack"},
		}}
	},
	groups = {cracky=3,level=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:sand", {
	description = "Nethersand",
	tiles = {"nether_sand.png"},
	is_ground_content = true,
	groups = {crumbly=3,level=2,falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.45},
	}),
})

minetest.register_node("nether:glowstone", {
	description = "Glowstone",
	tiles = {"nether_glowstone.png"},
	is_ground_content = true,
	light_source = 13,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("nether:brick", {
	description = "Nether Brick",
	tiles = {"nether_brick.png"},
	groups = {cracky=2,level=2},
	sounds = default.node_sound_stone_defaults(),
})

local function replace(old, new)
	for i=1,8 do
		minetest.register_ore({
			ore_type       = "scatter",
			ore            = new,
			wherein        = old,
			clust_scarcity = 1,
			clust_num_ores = 1,
			clust_size     = 1,
			height_min     = -31000,
			height_max     = NETHER_DEPTH,
		})
	end
end


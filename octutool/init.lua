
minetest.register_node("octutool:mese", {
	description = "Octu Super Mese",
	tiles = {"octu_mese.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("octutool:string", {
	description = "String",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"octu_string.png"},
	inventory_image = "octu_string.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	sounds = default.node_sound_defaults(),
})
minetest.register_node("octutool:string_shards", {
	description = "String Shards",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"octu_stringshards.png"},
	inventory_image = "octu_stringshards.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy=3,dig_immediate=3,flammable=2},
	sounds = default.node_sound_defaults(),

})
minetest.register_node("octutool:ladder", {
	description = "Octu Ladder",
	drawtype = "signlike",
	tiles = {"octu_ladder.png"},
	inventory_image = "octu_ladder.png",
	wield_image = "octu_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	is_ground_content = true,
	walkable = false,
	climbable = true,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=3,flammable=2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})
minetest.register_node("octutool:box", {
	tiles = {"octu_cart_bottom.png", "octu_cart_side.png", "octu_cart_side.png", "octu_cart_side.png", "octu_cart_side.png"},
        paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.45, -0.5, 0.5, 0.5, -0.5+1/16},
			{-0.5, -0.45, -0.5, -0.5+1/16, 0.5, 0.5},
			{0.5, -0.5, 0.5, -0.5, 0.5, 0.5-1/16},
			{0.5, -0.5, 0.5, 0.5-1/16, 0.5, -0.5},

			{-0.5, -0.5, -0.5, 0.5, -0.3, 0.5},
		},
	},
	groups = {oddly_breakable_by_hand=3,},
})


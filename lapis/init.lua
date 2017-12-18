-- dofile(minetest.get_modpath("lapis").."/columns.lua")
minetest.register_alias("lapis:sacred_ore", "lapis:lazurite")

----------
-- Items
----------

minetest.register_node( "lapis:lapis_block",  {
   description = "Lapis with Calcite",
--   inventory_image = "lapis_block.png",
   tiles = {"lapis_block.png", "lapis_block.png", "lapis_block_side.png", "lapis_block_side.png", "lapis_block_side.png", "lapis_block_side.png" },
   paramtype = "light",
   sunlight_propagates = false,
   is_ground_content = true,
   groups = {cracky=3},
   sounds = default.node_sound_stone_defaults()
})

minetest.register_node( "lapis:lapis_brick",  {
   description = "Lapis Brick",
--   inventory_image = "lapis_brick.png",
   tiles = {"lapis_brick_top.png", "lapis_brick_top.png^[transformFXR90", "lapis_brick_side.png", "lapis_brick_side.png^[transformFX", "lapis_brick.png^[transformFX", "lapis_brick.png" },
   paramtype = "light",
   is_ground_content = false,
   sunlight_propagates = false,
   groups = {cracky=2},
   sounds = default.node_sound_stone_defaults()
})

minetest.register_node( "lapis:lapis_cobble",  {
   description = "Cobbled Lapis",
--   inventory_image = "lapis_cobble.png",
   tiles = {"lapis_cobble.png", "lapis_cobble.png^[transformFYR90", "lapis_cobble.png^[transformFX", "lapis_cobble.png", "lapis_cobble.png^[transformFX", "lapis_cobble.png" },
   paramtype = "light",
   is_ground_content = false,
   sunlight_propagates = false,
   groups = {cracky=3},
   sounds = default.node_sound_stone_defaults()
})

minetest.register_node( "lapis:lazurite",  {
   description = "Lazurite",
--   inventory_image = "lapis_lazurite.png",
   tiles = {"lapis_lazurite.png", "lapis_lazurite.png", "lapis_lazurite_side.png", "lapis_lazurite_side.png", "lapis_lazurite_side.png", "lapis_lazurite_side.png" },
   paramtype = "light",
   sunlight_propagates = false,
   is_ground_content = true,
drop={
	items = {
	  {items = {"lapis:pyrite_lump"}, rarity =10},
			{items = {"lapis:lapis_stone"}, rarity =5},
		 {items = {'lapis:lapis_cobble'}},
		},
	},
   groups = {cracky=2},
   sounds = default.node_sound_stone_defaults()
})

minetest.register_node( "lapis:lazurite_brick",  {
   description = "Lazurite Brick",
--   inventory_image = "lapis_lazurite_brick.png",
   tiles = {"lapis_lazurite_brick_top.png", "lapis_lazurite_brick_top.png^[transformFXR90", "lapis_lazurite_brick_side.png", "lapis_lazurite_brick_side.png^[transformFX", "lapis_lazurite_brick.png^[transformFX", "lapis_lazurite_brick.png" },
   paramtype = "light",
   is_ground_content = false,
   sunlight_propagates = false,
   groups = {cracky=1},
   sounds = default.node_sound_stone_defaults()
})

minetest.register_node( "lapis:lapis_tile",  {
   description = "Lapis Floor Tile",
--   inventory_image = "lapis_tile.png",
   tiles = {"lapis_tile.png" },
   drawtype = 'nodebox',
   walkable = false,
   buildable_to = true,
   is_ground_content = false,
   sunlight_propagates = false,
   paramtype = 'light',
   groups = {cracky=3},
   paramtype2 = "facedir",
   node_box = {
					 type = "fixed",
					 fixed =	 { -0.5, -0.5, -0.5, 0.5, -0.45, 0.5 }
		 },
   sounds = default.node_sound_stone_defaults()
   })

 minetest.register_node( "lapis:lapis_paver",  {
   description = "Lapis Paver",
--   inventory_image = "lapis_paver.png",
   tiles = {"lapis_paver.png" },
   drawtype = 'nodebox',
   walkable = false,
   buildable_to = true,
   is_ground_content = false,
   sunlight_propagates = false,
   paramtype = 'light',
   groups = {cracky=2},
   paramtype2 = "facedir",
		 node_box = {
					 type = "fixed",
					 fixed =	 { -0.5, -0.5, -0.5, 0.5, -0.45, 0.5 }
		 },
	sounds = default.node_sound_stone_defaults()
})


minetest.register_node( "lapis:pyrite_block",  {
   description = "Pyrite Block",
   tiles = {"lapis_pyrite_block.png" },
--   inventory_image = "lapis_pyrite_block.png",
   paramtype = "light",
   is_ground_content = false,
   sunlight_propagates = false,
   groups = {cracky=2},
   sounds = default.node_sound_stone_defaults() ,
})

minetest.register_node( "lapis:pyrite_sacred",  {
   description = "Cathedral Pyrite",
   tiles = {"lapis_pyrite_sacred.png", "lapis_pyrite_block.png", "lapis_pyrite_sacred_side.png", "lapis_pyrite_sacred_side.png", "lapis_pyrite_sacred_side.png", "lapis_pyrite_sacred_side.png", },
--   inventory_image = "lapis_pyrite_sacred.png",
   paramtype = "light",
   paramtype2 = "facedir",
   is_ground_content = false,
   sunlight_propagates = false,
   groups = {cracky=1},
   sounds = default.node_sound_stone_defaults() ,
})

	--Stairs & Slabs

	if minetest.get_modpath("stairs") then
stairs.register_stair_and_slab("lapisblock", "lapis:lapisblock",
		{cracky=3},
		{"lapis_block.png"},
		"Lapis Stair",
		"Lapis Slab",
		default.node_sound_stone_defaults())

		stairs.register_stair_and_slab("lapis_brick", "lapis:lapis_brick",
		{cracky=3},
		{"lapis_brick.png"},
		"Lapis Brick Stair",
		"Lapis Brick Slab",
		default.node_sound_stone_defaults())

		stairs.register_stair_and_slab("lapis_cobble", "lapis:lapis_cobble",
		{cracky=3},
		{"lapis_cobble.png"},
		"Lapis Cobble Stair",
		"Lapis Cobble Slab",
		default.node_sound_stone_defaults())

		stairs.register_stair_and_slab("lazurite", "lapis:lazurite",
		{cracky=3},
		{"lapis_lazurite.png"},
		"Lazurite Stair",
		"Lazurite Slab",
		default.node_sound_stone_defaults())

		stairs.register_stair_and_slab("lazurite_brick", "lapis:lazurite_brick",
		{cracky=3},
		{"lapis_lazurite_brick.png"},
		"Lazurite Brick Stair",
		"Lazurite Brick Slab",
		default.node_sound_stone_defaults())

		end

---------------
-- Crafts Items
---------------



----------
-- Crafts
----------


-- Cookings

--Lapis / Pyrite Ore Generation
--Sheet ore registration


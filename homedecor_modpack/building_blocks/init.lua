minetest.register_node("building_blocks:Adobe", {
	tiles = {"building_blocks_Adobe.png"},
	description = "Adobe",
	is_ground_content = true,
	groups = {crumbly=3},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("building_blocks:Roofing", {
	tiles = {"building_blocks_Roofing.png"},
	is_ground_content = true,
	description = "Roof block",
	groups = {snappy=3},
})

minetest.register_node("building_blocks:smoothglass", {
	drawtype = "glasslike",
	description = "Streak Free Glass",
	tiles = {"building_blocks_sglass.png"},
	inventory_image = minetest.inventorycube("building_blocks_sglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=3,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})
minetest.register_node("building_blocks:grate", {
	drawtype = "glasslike",
	description = "Grate",
	tiles = {"building_blocks_grate.png"},
	inventory_image = minetest.inventorycube("building_blocks_grate.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky=1},
})

minetest.register_node("building_blocks:Fireplace", {
	description = "Fireplace",
	tiles = {
		"building_blocks_cast_iron.png",
		"building_blocks_cast_iron.png",
		"building_blocks_cast_iron.png",
		"building_blocks_cast_iron_fireplace.png"
	},
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = default.LIGHT_MAX,
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky=2},
})

minetest.register_node("building_blocks:woodglass", {
	drawtype = "glasslike",
	description = "Wood Framed Glass",
	tiles = {"building_blocks_wglass.png"},
	inventory_image = minetest.inventorycube("building_blocks_wglass.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {snappy=3,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})
minetest.register_node("building_blocks:terrycloth_towel", {
	drawtype = "raillike",
	description = "Terrycloth towel",
	tiles = {"building_blocks_towel.png"},
	inventory_image = "building_blocks_towel_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly=3},
})
minetest.register_node("building_blocks:Tarmac_spread", {
	drawtype = "raillike",
	description = "Tarmac Spread",
	tiles = {"building_blocks_tar.png"},
	inventory_image = "building_blocks_tar_spread_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_dirt_defaults(),
})
minetest.register_node("building_blocks:BWtile", {
	drawtype = "raillike",
	description = "Chess board tiling",
	tiles = {"building_blocks_BWtile.png"},
	inventory_image = "building_blocks_bwtile_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly=3},
})
minetest.register_node("building_blocks:brobble_spread", {
	drawtype = "raillike",
	description = "Brobble Spread",
	tiles = {"building_blocks_brobble.png"},
	inventory_image = "building_blocks_brobble_spread_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly=3},
})
minetest.register_node("building_blocks:gravel_spread", {
	drawtype = "raillike",
	description = "Gravel Spread",
	tiles = {"default_gravel.png"},
	inventory_image = "building_blocks_gravel_spread_inv.png",
	paramtype = "light",
	walkable = false,
	selection_box = {
		type = "fixed",
                -- but how to specify the dimensions for curved and sideways rails?
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly=2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})
minetest.register_node("building_blocks:hardwood", {
	tiles = {"building_blocks_hardwood.png"},
	is_ground_content = true,
	description = "Hardwood",
	groups = {choppy=1,flammable=1},
	sounds = default.node_sound_wood_defaults(),
})

if minetest.get_modpath("moreblocks") then

	stairsplus:register_all(
		"building_blocks",
		"marble",
		"building_blocks:Marble",
		{
			description = "Marble",
			tiles = {"building_blocks_marble.png"},
			groups = {cracky=3},
			sounds = default.node_sound_stone_defaults(),
		}
	)
	stairsplus:register_all(
		"building_blocks",
		"hardwood",
		"building_blocks:hardwood",
		{
			description = "Hardwood",
			tiles = {"building_blocks_hardwood.png"},
			groups = {choppy=1,flammable=1},
			sounds = default.node_sound_wood_defaults(),
		}
	)
	stairsplus:register_all(
		"building_blocks",
		"fakegrass",
		"building_blocks:fakegrass",
		{
			description = "Grass",
			tiles = {"default_grass.png"},
			groups = {crumbly=3},
			sounds = default.node_sound_dirt_defaults({
				footstep = {name="default_grass_footstep", gain=0.4},
			}),
		}
	)
	stairsplus:register_all(
		"building_blocks",
		"tar",
		"building_blocks:Tar",
		{
			description = "Tar",
			tiles = {"building_blocks_tar.png"},
			groups = {crumbly=1},
			sounds = default.node_sound_stone_defaults(),
		}
	)
	stairsplus:register_all(
		"building_blocks",
		"grate",
		"building_blocks:grate",
		{
			description = "Grate",
			tiles = {"building_blocks_grate.png"},
			groups = {cracky=1},
			sounds = default.node_sound_stone_defaults(),
		}
	)
	stairsplus:register_all(
		"building_blocks",
		"Adobe",
		"building_blocks:Adobe",
		{
			description = "Adobe",
			tiles = {"building_blocks_Adobe.png"},
			groups = {crumbly=3},
			sounds = default.node_sound_stone_defaults(),
		}
	)
	stairsplus:register_all(
		"building_blocks",
		"Roofing",
		"building_blocks:Roofing",
		{
			description = "Roofing",
			tiles = {"building_blocks_Roofing.png"},
			groups = {snappy=3},
			sounds = default.node_sound_stone_defaults(),
		}
	)
else
	bb_stairs = {}

	-- Node will be called stairs:stair_<subname>
	function bb_stairs.register_stair(subname, recipeitem, groups, images, description)
		minetest.register_node("building_blocks:stair_" .. subname, {
			description = description,
			drawtype = "nodebox",
			tiles = images,
			paramtype = "light",
			paramtype2 = "facedir",
			is_ground_content = true,
			groups = groups,
			node_box = {
				type = "fixed",
				fixed = {
					{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
					{-0.5, 0, 0, 0.5, 0.5, 0.5},
				},
			},
		})

		
	end

	-- Node will be called stairs:slab_<subname>
	function bb_stairs.register_slab(subname, recipeitem, groups, images, description)
		minetest.register_node("building_blocks:slab_" .. subname, {
			description = description,
			drawtype = "nodebox",
			tiles = images,
			paramtype = "light",
			is_ground_content = true,
			groups = groups,
			node_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			},
		})

		
	end

	-- Nodes will be called stairs:{stair,slab}_<subname>
	function bb_stairs.register_stair_and_slab(subname, recipeitem, groups, images, desc_stair, desc_slab)
		bb_stairs.register_stair(subname, recipeitem, groups, images, desc_stair)
		bb_stairs.register_slab(subname, recipeitem, groups, images, desc_slab)
	end
	bb_stairs.register_stair_and_slab("marble","building_blocks:Marble",
		{cracky=3},
		{"building_blocks_marble.png"},
		"Marble stair",
		"Marble slab"
	)
	bb_stairs.register_stair_and_slab("hardwood","building_blocks:hardwood",
		{choppy=1,flammable=1},
		{"building_blocks_hardwood.png"},
		"Hardwood stair",
		"Hardwood slab"
	)
	bb_stairs.register_stair_and_slab("fakegrass","building_blocks:fakegrass",
		{crumbly=3},
		{"default_grass.png"},
		"Grass stair",
		"Grass slab"
	)
	bb_stairs.register_stair_and_slab("tar","building_blocks:Tar",
		{crumbly=1},
		{"building_blocks_tar.png"},
		"Tar stair",
		"Tar slab"
	)
	bb_stairs.register_stair_and_slab("grate","building_blocks:grate",
		{cracky=1},
		{"building_blocks_grate.png"},
		"Grate Stair",
		"Grate Slab"
	)
	bb_stairs.register_stair_and_slab("Adobe", "building_blocks:Adobe",
		{crumbly=3},
		{"building_blocks_Adobe.png"},
		"Adobe stair",
		"Adobe slab"
	)
	bb_stairs.register_stair_and_slab("Roofing", "building_blocks:Roofing",
		{snappy=3},
		{"building_blocks_Roofing.png"},
		"Roofing stair",
		"Roofing slab"
	)
end



--Tar
--minetest.register_alias("tar", "building_blocks:Tar")
minetest.register_alias("fakegrass", "building_blocks:fakegrass")
minetest.register_alias("tar_knife", "building_blocks:knife")
minetest.register_alias("adobe", "building_blocks:Adobe")
minetest.register_alias("building_blocks_roofing", "building_blocks:Roofing")
minetest.register_alias("hardwood", "building_blocks:hardwood")
minetest.register_alias("sticks", "building_blocks:sticks")
minetest.register_alias("building_blocks:faggot", "building_blocks:sticks")
minetest.register_alias("marble", "building_blocks:Marble")

minetest.register_node("building_blocks:Tar", {
	description = "Tar",
	tiles = {"building_blocks_tar.png"},
	is_ground_content = true,
	groups = {crumbly=1, tar_block = 1},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_node("building_blocks:Marble", {
	description = "Marble",
	tiles = {"building_blocks_marble.png"},
	is_ground_content = true,
	groups = {cracky=3, marble = 1},
	sounds = default.node_sound_stone_defaults(),
})



if not minetest.get_modpath("technic") then 
	minetest.register_node( ":technic:granite", {
		    description = "Granite",
		    tiles = { "technic_granite.png" },
		    is_ground_content = true,
		    groups = {cracky=1},
		    sounds = default.node_sound_stone_defaults(),
	}) 

	

	if minetest.get_modpath("moreblocks") then
		stairsplus:register_all("technic", "granite", "technic:granite", {
				description="Granite",
				groups={cracky=1, not_in_creative_inventory=1},
				tiles={"technic_granite.png"},
		})
	end
end

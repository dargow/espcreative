---------------------------------------------------------------------------------------
-- decoration and building material
---------------------------------------------------------------------------------------
-- * includes a wagon wheel that can be used as decoration on walls or to build (stationary) wagons
-- * dirt road - those are more natural in small old villages than cobble roads
-- * loam - no, old buildings are usually not built out of clay; loam was used
-- * straw - useful material for roofs
-- * glass pane - an improvement compared to fence posts as windows :-)
---------------------------------------------------------------------------------------

local S = cottages.S

-- can be used to buid real stationary wagons or attached to walls as decoration
minetest.register_node("cottages:wagon_wheel", {
        description = S("wagon wheel"),
        drawtype = "signlike",
        tiles = {"cottages_wagonwheel.png"}, -- done by VanessaE!
        inventory_image = "cottages_wagonwheel.png",
        wield_image = "cottages_wagonwheel.png",
        paramtype = "light",
        paramtype2 = "wallmounted",

        sunlight_propagates = true,
        walkable = false,
        selection_box = {
                type = "wallmounted",
        },
        groups = {choppy=2,dig_immediate=2,attached_node=1},
        legacy_wallmounted = true,
        sounds = default.node_sound_defaults(),
	is_ground_content = false,
})


-- people didn't use clay for houses; they did build with loam
minetest.register_node("cottages:loam", {
        description = S("loam"),
        tiles = {"cottages_loam.png"},
	groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
        groups = {crumbly=3},
        sounds = default.node_sound_dirt_defaults,
	is_ground_content = false,
})

-- create stairs if possible
if( minetest.get_modpath("stairs") and stairs and stairs.register_stair_and_slab) then

   stairs.register_stair_and_slab("loam", "cottages:loam",
		{snappy=2,choppy=2,oddly_breakable_by_hand=2},
		{"cottages_loam.png"},
		S("Loam Stairs"),
		S("Loam Slab"),
		default.node_sound_dirt_defaults())

   if( minetest.registered_nodes["default:clay"]) then
      stairs.register_stair_and_slab("clay", "default:clay",
	        {crumbly=3},
		{"cottages_clay.png"},
		S("Clay Stairs"),
		S("Clay Slab"),
		default.node_sound_dirt_defaults())
   end
end


-- straw is a common material for places where animals are kept indoors
-- right now, this block mostly serves as a placeholder

minetest.register_alias("cottages:straw_ground", "air")

-- note: these houses look good with a single fence pile as window! the glass pane is the version for 'richer' inhabitants
minetest.register_node("cottages:glass_pane", {
		description = S("simple glass pane (centered)"),
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"cottages_glass_pane.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.05,  0.5, 0.5,  0.05},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.05,  0.5, 0.5,  0.05},
			},
		},
		is_ground_content = false,
})


minetest.register_node("cottages:glass_pane_side", {
		description = S("simple glass pane"),
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"cottages_glass_pane.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.40,  0.5, 0.5, -0.50},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.40,  0.5, 0.5, -0.50},
			},
		},
		is_ground_content = false,
})


---------------------------------------------------------------------------------------
-- a very small wooden slab
---------------------------------------------------------------------------------------
minetest.register_node("cottages:wood_flat", {
		description = S("flat wooden planks"),
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"cottages_minimal_wood.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.50,  0.5, -0.5+1/16, 0.50},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.50,  0.5, -0.5+1/16, 0.50},
			},
		},
		is_ground_content = false,
		on_place = minetest.rotate_node,
})

---------------------------------------------------------------------------------------
-- useful for building tents
---------------------------------------------------------------------------------------
minetest.register_node("cottages:wool_tent", {
		description = S("wool for tents"),
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = {"cottages_wool.png"},
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2},
		node_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.50,  0.5, -0.5+1/16, 0.50},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.50,  0.5, -0.5+1/16, 0.50},
			},
		},
		is_ground_content = false,
		on_place = minetest.rotate_node,
})

-- a fallback for cases in which there is no wool
minetest.register_node("cottages:wool", {
		description = "Wool",
		tiles = {"cottages_wool.png"},
		is_ground_content = false,
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,wool=1},
})


---------------------------------------------------------------------------------------
-- crafting receipes
---------------------------------------------------------------------------------------



--[[
Mod for Minetest that adds bridges (only one node wide!), slim handrails and a self-building-one-node-wide bridge.
    
    Copyright (C) 2013 Sokomine

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

-- to make life a bit easier
bild_pfad          = "default_wood.png"; --"forniture_wood.png";
bild_pfad_s1       = bild_pfad; --"forniture_wood_s1.png";
bild_pfad_s2       = bild_pfad; --"forniture_wood_s2.png";
--bild_pfad_s1       = "default_wood.png"; --"forniture_wood_s1.png";
--bild_pfad_s2       = "default_wood.png"; --"forniture_wood_s2.png";

leg_front_left     = {-0.5,-0.5,-0.5, -0.4,0.5,-0.4};
leg_front_right    = { 0.4,-0.5,-0.5,  0.5,0.5,-0.4};
leg_back_left      = {-0.5,-0.5, 0.4, -0.4,0.5, 0.5}; 
leg_back_right     = { 0.4,-0.5, 0.4,  0.5,0.5, 0.5}; 

bar_left           = {-0.5, 0.35,-0.4,-0.4, 0.4, 0.4}; 
bar_right          = { 0.4, 0.35,-0.4, 0.5, 0.4, 0.4};
bar_back           = { 0.4, 0.35, 0.4,-0.5, 0.4, 0.5};
bar_front          = { 0.5, 0.35,-0.5,-0.5, 0.4,-0.4};

bar_left_long      = {-0.4, 0.35,-0.5,-0.5, 0.4, 0.5}; 
bar_right_long     = { 0.4, 0.35,-0.5, 0.5, 0.4, 0.5};

groundplate_small  = {-0.4,-0.45,-0.5,  0.4,-0.4,0.5};
groundplate_corner = {-0.5,-0.45,-0.5,  0.5,-0.4,0.5}; -- slightly larger


local STICK = "group:stick";
local WOOD  = "stairs:slab_wood";
local BASIS = "bridges:bridge_basis";
local RAIL  = "bridges:handrail_middle";
-- people who do not have vines have to replace "vines:vines" with something they do have and which they think might fit
local VINES = "vines:vines"; -- useful for ropes
local ALT   = "group:leaves"; -- alternative for vines

if( minetest.get_modpath( 'moon' ) or minetest.get_modpath( 'moonrealm') or minetest.get_modpath( 'moontest') ) then
	STICK = "group:stick";
	WOOD  = "default:steel_ingot";
	VINES = "group:stone";
	ALT   = "group:leaves"; -- alternative for vines

	bild_pfad          = "default_steel_block.png"; --"forniture_wood.png";
	bild_pfad_s1       = bild_pfad; --"forniture_wood_s1.png";
	bild_pfad_s2       = bild_pfad; --"forniture_wood_s2.png";

-- only if no moontest is installed
elseif( minetest.get_modpath( 'moreblocks' )) then
	WOOD = 'moreblocks:slab_wood';
end
	

local MAX_BRIDGE_LENGTH = 27; -- this is how far the automatic bridge can extend


local BRIDGE_PARTS = {
        -- name, description, node definition, crafting receipe, additional information for yield of receipe

        -- the groundplate - essential for bridge building
        { "bridge_basis", "groundplate of a bridge", {
                                        groundplate_small, },
                         { { VINES, VINES, VINES },
                           { VINES, WOOD,  VINES },
                           { VINES, VINES, VINES }
                         }, " 2"}, -- yields 2 groundplates
        -- the handrail is a basic part out of which bridges and handrails for staircases can be constructed
	{ "handrail_middle", "handrail for bridges and staircases", {
					bar_front },
                         { { "",    "",    ""    },
                           { "",    BASIS, ""    },
                           { "",    "",    ""    }
                         }, " 4"}, -- one groundplate yiels 4 handrails
 
        -- bridges
 	{ "bridge_small", "small bridge", { -- TODO: slim legs?
                                        leg_front_left, 
                                        leg_front_right, 
                                        leg_back_left, 
                                        leg_back_right,
                                        bar_right,
                                        bar_left,
                                        groundplate_small, },
                         { { STICK, "",    STICK },
                           { RAIL,  BASIS, RAIL  },
                           { STICK, "",    STICK }
                         }, "" },
	{ "bridge_middle", "middle of a bridge", {
					bar_right_long,
					bar_left_long,
					groundplate_small, },
                         { { "",    "",    ""    },
                           { RAIL,  BASIS, RAIL  },
                           { "",    "",    ""    }
                         }, "" },
	{ "bridge_corner", "corner of a bridge", {
                                        leg_front_left, 
                                        leg_front_right, 
                                        leg_back_left, 
                                        leg_back_right,
                                        bar_right,
                                        bar_back,
                                        groundplate_corner, },
                         { { STICK, RAIL,  STICK },
                           { "",    BASIS, RAIL  },
                           { STICK, "",    STICK }
                         }, "" },
	{ "bridge_t",  "T junction of a bridge", {
                                        leg_front_left, 
                                        leg_front_right, 
                                        leg_back_left, 
                                        leg_back_right,
                                        bar_back,
                                        groundplate_corner, },
                         { { STICK, RAIL,  STICK },
                           { "",    BASIS, ""    },
                           { STICK, "",    STICK }
                         }, "" },
        { "bridge_end", "end of a bridge", {
                                        leg_front_left, 
                                        leg_front_right, 
                                        leg_back_left, 
                                        leg_back_right,
                                        bar_left,
                                        bar_right,
                                        bar_back,
                                        groundplate_corner, },
                         { { STICK, RAIL,  STICK },
                           { RAIL,  BASIS, RAIL  },
                           { STICK, "",    STICK }
                         }, "" },

	-- handrails for the top of starcaises so that people won't fall down
	{ "handrail_top", "handrail for staircases, one side closed", {
					leg_front_left,
					leg_front_right,
					bar_front, },
                         { { "",    "",    ""    },
                           { "",    "",    ""    },
                           { STICK, RAIL,  STICK }
                         }, "" },


	{ "handrail_corner", "handrail for staircases, two sides closed", {
					leg_front_left,
					leg_front_right,
					bar_front, 
					bar_left },
                         { { STICK, "",    ""    },
                           { RAIL,  "",    ""    },
                           { STICK, RAIL,  STICK }
                         }, "" },

	{ "handrail_closed", "handrail for staircases, three sides closed", {
					leg_front_left,
					leg_front_right,
					bar_front, 
					bar_right,
					bar_left },
                         { { STICK, RAIL,  STICK },
                           { RAIL,  "",    ""    },
                           { STICK, RAIL,  STICK }
                         }, "" },
        }


for i in ipairs( BRIDGE_PARTS ) do
	minetest.register_node("bridges:"..BRIDGE_PARTS[i][1],
			{ 
			description = BRIDGE_PARTS[i][2],

			tiles = {
				bild_pfad,
				bild_pfad,
				bild_pfad_s1,
				bild_pfad_s1,
				bild_pfad_s2,
				bild_pfad_s2,
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = BRIDGE_PARTS[i][3],
			},
			selection_box = {
				type = "fixed",
                                fixed = {-0.5,-0.5,-0.5, 0.5, 0.5, 0.5},

			},
                        -- flammable so that it can be burned if no longer needed
		        groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=3},
                });

       
end

-- alternate receipe for the bridge basis
        minetest.register_craft({
               output = "bridges:bridge_basis 2",
               recipe = { { ALT,   ALT,   ALT   },
                          { ALT,   WOOD,  ALT   },
                          { ALT,   ALT,   ALT   },
                         }, 
        });

-- a bridge with covers 3 nodes in size

		minetest.register_node("bridges:bridge_large",
			{ description = 'large bridge',
			tiles = {
				bild_pfad,
				bild_pfad,
				bild_pfad_s1,
				bild_pfad_s1,
				bild_pfad_s2,
				bild_pfad_s2,
			},
			drawtype = "nodebox",
			sunlight_propagates = true,
			paramtype = 'light',
			paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {
                                        -- the large bridge covers 3 nodes
					{-0.5,-0.5,-0.7, -0.4,0.5,-0.6},
					{ 0.4,-0.5,-0.7,  0.5,0.5,-0.6},

					{-0.5, 0.35,-1.5, -0.4,0.4, 1.5},

					{-0.5,-0.5, 0.6, -0.4,0.5, 0.7},
					{ 0.4,-0.5, 0.6,  0.5,0.5, 0.7},

					{ 0.4, 0.35,-1.5,  0.5,0.4, 1.5},

					{-0.4,-0.45,-1.5,  0.4,-0.4,1.5},

                                        }
			},
			selection_box = {
				type = "fixed",
                                fixed = {-0.5,-0.5,-1.5,  0.5,0.5, 1.5},

			},
		        groups = {snappy=2,choppy=2,oddly_breakable_by_hand=2,flammable=2}
                })

        




-- special: self-building automatic bridge



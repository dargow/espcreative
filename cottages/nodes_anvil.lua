---------------------------------------------------------------------------------------
-- simple anvil that can be used to repair tools
---------------------------------------------------------------------------------------
-- * can be used to repair tools
-- * the hammer gets dammaged a bit at each repair step
---------------------------------------------------------------------------------------
-- License of the hammer picture: CC-by-SA; done by GloopMaster; source:
--   https://github.com/GloopMaster/glooptest/blob/master/glooptest/textures/glooptest_tool_steelhammer.png

local S = cottages.S

minetest.register_node("cottages:anvil", {
	drawtype = "nodebox",
	description = S("anvil"),
	tiles = {"cottages_stone.png"}, -- TODO default_steel_block.png,  default_obsidian.png are also nice
	paramtype  = "light",
        paramtype2 = "facedir",
	groups = {cracky=2},
	-- the nodebox model comes from realtest
	node_box = {
		type = "fixed",
		fixed = {
				{-0.5,-0.5,-0.3,0.5,-0.4,0.3},
				{-0.35,-0.4,-0.25,0.35,-0.3,0.25},
				{-0.3,-0.3,-0.15,0.3,-0.1,0.15},
				{-0.35,-0.1,-0.2,0.35,0.1,0.2},
			},
	},
	selection_box = {
		type = "fixed",
		fixed = {
				{-0.5,-0.5,-0.3,0.5,-0.4,0.3},
				{-0.35,-0.4,-0.25,0.35,-0.3,0.25},
				{-0.3,-0.3,-0.15,0.3,-0.1,0.15},
				{-0.35,-0.1,-0.2,0.35,0.1,0.2},
			}
	},
	on_construct = function(pos)

		local meta = minetest.get_meta(pos);
               	meta:set_string("infotext", S("Anvil"));
               	local inv = meta:get_inventory();
               	inv:set_size("input",    1);
--               	inv:set_size("material", 9);
--               	inv:set_size("sample",   1);
               	inv:set_size("hammer",   1);
                meta:set_string("formspec", cottages_anvil_formspec );
       	end,
	is_ground_content = false,
})



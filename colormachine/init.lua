minetest.register_node("colormachine:colormachine", {
        description = "spray booth",

        tiles = {
		"colormachine_top.png",
		"colormachine_bottom.png",
		"colormachine_side.png",
		"colormachine_side.png",
		"colormachine_side.png",
		"colormachine_front.png",
	},

        paramtype2 = "facedir",
        groups = {cracky=2},
        legacy_facedir_simple = true,

        
})


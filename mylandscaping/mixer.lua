
minetest.register_alias("myconcrete:concrete", 	"mylandscaping:concrete")


minetest.register_node('mylandscaping:mixer', {
	description = 'concrete mixer',
	drawtype = 'mesh',
	mesh = 'mylandscaping_crusher.obj',
	tiles = {
		{name='mylandscaping_tex1.png'},{name='mylandscaping_supports.png'},{name='mylandscaping_base.png'},{name='mylandscaping_hopper.png'},{name='mylandscaping_crusher.png'}},
	groups = {oddly_breakable_by_hand=2},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 1.5, 1.5, 0.5}, 
		}
	},
	collision_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 1.5, 1.5, 0.5},
		}
	},


})



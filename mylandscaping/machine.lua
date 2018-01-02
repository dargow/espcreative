local material = {}
local block = {}
local make_ok = false
local anzahl = 0
local material2 = {}
local stone = {}
local deco = {}


minetest.register_node('mylandscaping:machine', {
	description = 'concrete forms',
	drawtype = 'mesh',
	mesh = 'mylandscaping_cement_mixer.obj',
	tiles = {
		{name='mylandscaping_tex3.png'},{name='mylandscaping_tex1.png'},{name='default_gravel.png'},{name='mylandscaping_tex2.png'}},
	groups = {oddly_breakable_by_hand=2},
	paramtype = 'light',
	paramtype2 = 'facedir',
	selection_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 1.1, 0.5, 0.5}, 
			{1.1, -0.5, -0.1, 1.5, -0.3, 0.5}
		}
	},
	collision_box = {
		type = 'fixed',
		fixed = {
			{-0.5, -0.5, -0.5, 1.1, 0.5, 0.5},
			{1.1, -0.5, -0.1, 1.5, -0.3, 0.5}
		}
	},


})

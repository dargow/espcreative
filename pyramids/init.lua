local img = {"eye", "men", "sun"}

for i=1,3 do
	minetest.register_node("pyramids:deco_stone"..i, {
		description = "Sandstone with "..img[i],
		tiles = {"default_sandstone.png^pyramids_"..img[i]..".png"},
		is_ground_content = true,
		groups = {crumbly=2,cracky=3},
		sounds = default.node_sound_stone_defaults(),
		paramtype2 = "facedir",
	})
end


minetest.register_node("pyramids:trap", {
	description = "Cracked sandstone brick",
	tiles = {"default_sandstone_brick.png^pyramids_crack.png"},
	is_ground_content = true,
	groups = {crumbly=2,cracky=3},
	sounds = default.node_sound_stone_defaults(),
	paramtype2 = "facedir",
})


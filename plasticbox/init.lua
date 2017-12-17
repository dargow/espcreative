local colours = {
		{"black", "Black", "000000C0",},
		{"cyan", "Cyan", "00eee070",},
		{"brown", "Brown", "735c4090",},
		{"blue", "Blue", "447DCF70",},
		{"darkgreen", "Dark Green", "00900970",},
		{"darkgrey", "Dark Grey", "00000070",},
		{"magenta", "Magenta", "EE00EE70",},
		{"green", "Green", "00E51070",},
		{"grey", "Grey", "00000050",},
		{"orange", "Orange", "DD500070",},
		{"pink", "Pink", "ff69b470",},
		{"violet", "Violet", "8a2be270",},
		{"red", "Red", "F0000070",},
		{"white", "White", "FFFFFF70",},
		{"yellow", "Yellow", "E0E00070",}
}

for i in ipairs(colours) do
	local name = colours[i][1]
	local description = colours[i][2]
	local hex = colours[i][3]

	minetest.register_node("plasticbox:plasticbox_"..name, {
		description = description.." Plasticbox",
		tiles = {"plasticbox_white.png^[colorize:#"..hex},
		is_ground_content = true,
		groups = {choppy=1},
		sounds = default.node_sound_stone_defaults(),
	})
end

minetest.register_alias("plasticbox:plasticbox", "plasticbox:plasticbox_white")


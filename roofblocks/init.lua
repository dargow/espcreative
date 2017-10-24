roofblocks = {}

minetest.register_node('roofblocks:roofclay', {
	description = 'Clay Tiles Roof',
	tiles = {'roofblocks_clay.png'},
	groups = {choppy=1,oddly_breakable_by_hand=2,flammable=3},
})

minetest.register_node('roofblocks:roofslates', {
	description = 'Slates Roof',
	tiles = {'roofblocks_slate.png'},
	groups = {choppy=1,oddly_breakable_by_hand=2,flammable=3},
})

minetest.register_node('roofblocks:roofsteel', {
	description = 'Steel Sheets Roof',
	tiles = {'roofblocks_steel.png'},
	groups = {choppy=1,oddly_breakable_by_hand=2},
})

minetest.register_node('roofblocks:roofwood', {
	description = 'Wooden Tiles Roof',
	tiles = {'roofblocks_wood.png'},
	groups = {choppy=1,oddly_breakable_by_hand=2,flammable=3},
})

minetest.register_craft({
	output = 'roofblocks:roofclay 2',
	recipe = {
		{'default:clay_brick', 'default:clay_brick', ''},
		{'group:stick', 'group:stick', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'roofblocks:roofslates 2',
	recipe = {
		{'default:stone', 'default:stone', ''},
		{'group:stick', 'group:stick', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'roofblocks:roofsteel 2',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', ''},
		{'group:stick', 'group:stick', ''},
		{'', '', ''},
	}
})

minetest.register_craft({
	output = 'roofblocks:roofwood 2',
	recipe = {
		{'group:wood', 'group:wood', ''},
		{'group:stick', 'group:stick', ''},
		{'', '', ''},
	}
})

if stairsplus then
	print ('[roofblocks] Stairplus registrations')
	function roofblocks.register_stairsplus(node) 
		local ndef = minetest.registered_nodes['roofblocks:'..node]
		if ndef then
			local def = {}
			def.description = ndef.description
			def.drop = ndef.drop
			def.sounds = ndef.sounds
			def.tiles = ndef.tiles
			def.sunlight_propagates = true
			def.light_source = ndef.light_source

			-- Group has to be copied or it will be added a 'not in creative inventory'
			def.groups = {}
			for k, v in pairs(ndef.groups)
			do
				def.groups[k] = v
			end

			stairsplus:register_all('roofblocks', node, 'roofblocks:'..node, def)
		end
	end

	roofblocks.register_stairsplus('roofclay')
	roofblocks.register_stairsplus('roofslates')
	roofblocks.register_stairsplus('roofsteel')
	roofblocks.register_stairsplus('roofwood')
end


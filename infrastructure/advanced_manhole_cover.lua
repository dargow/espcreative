-- Manhole cover
	local on_manhole_cover_punched = function(pos, node, puncher)
		if string.find(node.name, "infrastructure:manhole_cover") ~= nil then
			local name = node.name
			local state = node.param2
			if name == "infrastructure:manhole_cover_opened" then
				node.name = "infrastructure:manhole_cover_closed"
				node.param2 = state
			else
				node.name = "infrastructure:manhole_cover_opened"
				node.param2 = state
			end
			minetest.env:add_node(pos, {
				name = node.name,
				param2 = node.param2
			})
		end

	end

	minetest.register_node("infrastructure:manhole_cover_closed", {
		description = "Manhole cover",
		tile_images = {
			"infrastructure_manhole_cover_top_bottom.png",
			"infrastructure_manhole_cover_top_bottom.png",
			"infrastructure_manhole_cover_side.png",
			"infrastructure_manhole_cover_side.png",
			"infrastructure_manhole_cover_side.png",
			"infrastructure_manhole_cover_side.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky=2},
		node_box = {
			type = "fixed",
			fixed = {
				{-1/2, -1/2, -1/2, -5/16, -3/8, 1/2},
				{-3/16, -1/2, -1/2, -1/16, -3/8, 1/2},
				{1/16, -1/2, -1/2, 3/16, -3/8, 1/2},
				{5/16, -1/2, -1/2, 1/2, -3/8, 1/2},
				{-1/2, -1/2, -1/2, 1/2, -3/8, -3/8},
				{-1/2, -1/2, 3/8, 1/2, -3/8, 1/2},
				{-1/2, -1/2, -1/2, -1/16, -3/8, -5/16},
				{1/16, -1/2, -1/2, 1/2, -3/8, -5/16},
				{-1/2, -1/2, 5/16, -1/16, -3/8, 1/2},
				{1/16, -1/2, 5/16, 1/2, -3/8, 1/2}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/2, 1/2, -3/8, 1/2}
		},

		on_punch = on_manhole_cover_punched
	})

	minetest.register_node("infrastructure:manhole_cover_opened", {
		tile_images = {
			"infrastructure_manhole_cover_side.png",
			"infrastructure_manhole_cover_side.png",
			"infrastructure_manhole_cover_side.png",
			"infrastructure_manhole_cover_side.png",
			"infrastructure_manhole_cover_top_bottom.png",
			"infrastructure_manhole_cover_top_bottom.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky=2},
		drop = "infrastructure:manhole_cover_closed",
		node_box = {
			type = "fixed",
			fixed = {
				{-1/2, -1/2, 1/2, -5/16, 1/2, 5/8},
				{-3/16, -1/2, 1/2, -1/16, 1/2, 5/8},
				{1/16, -1/2, 1/2, 3/16, 1/2, 5/8},
				{5/16, -1/2, 1/2, 1/2, 1/2, 5/8},
				{-1/2, -1/2, 1/2, 1/2, -3/8, 5/8},
				{-1/2, 3/8, 1/2, 1/2, 1/2, 5/8},
				{-1/2, -1/2, 1/2, -1/8, -5/16, 5/8},
				{1/16, -1/2, 1/2, 1/2, -5/16, 5/8},
				{-1/2, 5/16, 1/2, -1/16, 1/2, 5/8},
				{1/16, 5/16, 1/2, 1/2, 1/2, 5/8}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, 1/2, 1/2, 1/2, 5/8}
		},

		on_punch = on_manhole_cover_punched
	})

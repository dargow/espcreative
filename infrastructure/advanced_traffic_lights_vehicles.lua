-- Traffic lights for vehicles
	function semaphores_vehicles(pos, node)
		if node.name == "infrastructure:traffic_lights_vehicles_bottom_1" then
			minetest.swap_node(pos, {name = "infrastructure:traffic_lights_vehicles_bottom_2", param2 = node.param2})
			pos.y = pos.y + 1
			minetest.swap_node(pos, {name = "infrastructure:traffic_lights_vehicles_top_2", param2 = node.param2})
		elseif node.name == "infrastructure:traffic_lights_vehicles_bottom_2" then
			minetest.swap_node(pos, {name = "infrastructure:traffic_lights_vehicles_bottom_3", param2 = node.param2})
			pos.y = pos.y + 1
			minetest.swap_node(pos, {name = "infrastructure:traffic_lights_vehicles_top_3", param2 = node.param2})
		elseif node.name == "infrastructure:traffic_lights_vehicles_bottom_3" then
			minetest.swap_node(pos, {name = "infrastructure:traffic_lights_vehicles_bottom_4", param2 = node.param2})
			pos.y = pos.y + 1
			minetest.swap_node(pos, {name = "infrastructure:traffic_lights_vehicles_top_4", param2 = node.param2})
		elseif node.name == "infrastructure:traffic_lights_vehicles_bottom_4" then
			minetest.swap_node(pos, {name = "infrastructure:traffic_lights_vehicles_bottom_1", param2 = node.param2})
			pos.y = pos.y + 1
			minetest.swap_node(pos, {name = "infrastructure:traffic_lights_vehicles_top_1", param2 = node.param2})
		end
	end

	for i = 1, 4 do
		minetest.register_node("infrastructure:traffic_lights_vehicles_top_"..tostring(i), {
			tile_images = {
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_vehicles_top_"..tostring(i)..".png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky = 3, not_in_creative_inventory = 1},
			light_source = TRAFFIC_LIGHTS_LIGHT_RANGE,
			node_box = {
				type = "fixed",
				fixed = {
					{-5/16, -1/2, -1/8, 5/16, 5/16, 1/8},
					{-7/16, -1/2, -1/16, 7/16, 7/16, 0},

					{-3/16, 3/16, -5/16, 3/16, 1/4, -1/8},
					{-1/4, 0, -1/4, -3/16, 3/16, -1/8},
					{3/16, 0, -1/4, 1/4, 3/16, -1/8},

					{-3/16, -5/16, -5/16, 3/16, -1/4, -1/8},
					{-1/4, -1/2, -1/4, -3/16, -5/16, -1/8},
					{3/16, -1/2, -1/4, 1/4, -5/16, -1/8}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {0, 0, 0, 0, 0, 0}
			}
		})

		minetest.register_node("infrastructure:traffic_lights_vehicles_bottom_"..tostring(i), {
			description = "Traffic lights for vehicles",
			inventory_image = "infrastructure_traffic_lights_vehicles.png",
			wield_image = "infrastructure_traffic_lights_vehicles.png",
			tile_images = {
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_side.png",
				"infrastructure_traffic_lights_vehicles_bottom_"..tostring(i)..".png"
			},
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky = 3, not_in_creative_inventory = 1},
			light_source = TRAFFIC_LIGHTS_LIGHT_RANGE,
			drop = "infrastructure:traffic_lights_vehicles_bottom_1",
			node_box = {
				type = "fixed",
				fixed = {
					{-5/16, -5/16, -1/8, 5/16, 1/2, 1/8},
					{-7/16, -7/16, -1/16, 7/16, 1/2, 0},

					{-3/16, 3/16, -5/16, 3/16, 1/4, -1/8},
					{-1/4, 0, -1/4, -3/16, 3/16, -1/8},
					{3/16, 0, -1/4, 1/4, 3/16, -1/8},

					{-1/16, -1/4, 1/8, 1/16, 1/4, 3/8},
					{-1/4, -1/16, 1/8, 1/4, 1/16, 3/8},
					{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.001}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {
				-- box
					{-5/16, -5/16, -1/8, 5/16, 21/16, 1/8},
					{-7/16, -7/16, -1/16, 7/16, 23/16, 0},
				-- top
					{-3/16, 3/16 + 1, -5/16, 3/16, 1/4 + 1, -1/8},
					{-1/4, 0 + 1, -1/4, -3/16, 3/16 + 1, -1/8},
					{3/16, 0 + 1, -1/4, 1/4, 3/16 + 1, -1/8},

					{-3/16, -5/16 + 1, -5/16, 3/16, -1/4 + 1, -1/8},
					{-1/4, -1/2 + 1, -1/4, -3/16, -5/16 + 1, -1/8},
					{3/16, -1/2 + 1, -1/4, 1/4, -5/16 + 1, -1/8},
				-- bottom
					{-3/16, 3/16, -5/16, 3/16, 1/4, -1/8},
					{-1/4, 0, -1/4, -3/16, 3/16, -1/8},
					{3/16, 0, -1/4, 1/4, 3/16, -1/8},

					{-1/16, -1/4, 1/8, 1/16, 1/4, 3/8},
					{-1/4, -1/16, 1/8, 1/4, 1/16, 3/8},
					{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.01}
				}
			},

			after_place_node = function(pos)
				local node = minetest.env:get_node(pos)
				node.name = "infrastructure:traffic_lights_vehicles_top_"..tostring(i)
				pos.y = pos.y + 1
				minetest.env:add_node(pos, node)
			end,

			after_dig_node = function(pos)
				local node = minetest.env:get_node(pos)
				node.name = "infrastructure:traffic_lights_vehicles_top_"..tostring(i)
				pos.y = pos.y + 1
				minetest.env:remove_node(pos)
			end,

			on_punch = function (pos, node)
				semaphores_vehicles(pos, node)
			end,

			mesecons = {effector = {
				action_on = function (pos, node)
					semaphores_vehicles(pos, node)
				end
			}}
		})
	end

	minetest.register_node("infrastructure:traffic_lights_vehicles_bottom_1", {
		description = "Traffic lights for vehicles",
		inventory_image = "infrastructure_traffic_lights_vehicles.png",
		wield_image = "infrastructure_traffic_lights_vehicles.png",
		tile_images = {
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_vehicles_bottom_1.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 3, not_in_creative_inventory = 0},
		light_source = TRAFFIC_LIGHTS_LIGHT_RANGE,
		node_box = {
			type = "fixed",
			fixed = {
				{-5/16, -5/16, -1/8, 5/16, 1/2, 1/8},
				{-7/16, -7/16, -1/16, 7/16, 1/2, 0},

				{-3/16, 3/16, -5/16, 3/16, 1/4, -1/8},
				{-1/4, 0, -1/4, -3/16, 3/16, -1/8},
				{3/16, 0, -1/4, 1/4, 3/16, -1/8},

				{-1/16, -1/4, 1/8, 1/16, 1/4, 3/8},
				{-1/4, -1/16, 1/8, 1/4, 1/16, 3/8},
				{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.001}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
			-- box
				{-5/16, -5/16, -1/8, 5/16, 21/16, 1/8},
				{-7/16, -7/16, -1/16, 7/16, 23/16, 0},
			-- top
				{-3/16, 3/16 + 1, -5/16, 3/16, 1/4 + 1, -1/8},
				{-1/4, 0 + 1, -1/4, -3/16, 3/16 + 1, -1/8},
				{3/16, 0 + 1, -1/4, 1/4, 3/16 + 1, -1/8},

				{-3/16, -5/16 + 1, -5/16, 3/16, -1/4 + 1, -1/8},
				{-1/4, -1/2 + 1, -1/4, -3/16, -5/16 + 1, -1/8},
				{3/16, -1/2 + 1, -1/4, 1/4, -5/16 + 1, -1/8},
			-- bottom
				{-3/16, 3/16, -5/16, 3/16, 1/4, -1/8},
				{-1/4, 0, -1/4, -3/16, 3/16, -1/8},
				{3/16, 0, -1/4, 1/4, 3/16, -1/8},

				{-1/16, -1/4, 1/8, 1/16, 1/4, 3/8},
				{-1/4, -1/16, 1/8, 1/4, 1/16, 3/8},
				{-1/4, -1/4, 3/8, 1/4, 1/4, 1/2 - 0.01}
			}
		},

		after_place_node = function(pos)
			local node = minetest.env:get_node(pos)
			node.name = "infrastructure:traffic_lights_vehicles_top_1"
			pos.y = pos.y + 1
			minetest.env:add_node(pos, node)
		end,

		after_dig_node = function(pos)
			local node = minetest.env:get_node(pos)
			node.name = "infrastructure:traffic_lights_vehicles_top_1"
			pos.y = pos.y + 1
			minetest.env:remove_node(pos)
		end,

		on_punch = function (pos, node)
			semaphores_vehicles(pos, node)
		end,

		mesecons = {effector = {
			action_on = function (pos, node)
				semaphores_vehicles(pos, node)
			end
		}}
	})

	minetest.register_alias("infrastructure:traffic_lights_vehicles", "infrastructure:traffic_lights_vehicles_bottom_1")

-- Boom barrier
	function move_arm(pos, node)
		local node = minetest.env:get_node(pos)
		local param2 = node.param2

		if param2 == 0 then
			dir = "z-"
		elseif param2 == 1 then
			dir = "x-"
		elseif param2 == 2 then
			dir = "z+"
		elseif param2 == 3 then
			dir = "x+"
		end

		minetest.sound_play("infrastructure_boom_barrier", {
			pos = pos,
			gain = BOOM_BARRIER_VOLUME,
			max_hear_distance = 50
		})

		if node.name == "infrastructure:boom_barrier_top_h" then
			minetest.swap_node(pos, {name = "infrastructure:boom_barrier_top_v", param2 = node.param2})

			if dir == "x+" then
				for i = 1, 10 do
					pos.x = pos.x + 1
					if (string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_h_bright")
					or string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_h_dark")) == nil then
						break
					end
					minetest.env:remove_node(pos)
					node.name = "infrastructure:boom_barrier_arm_v"
					minetest.env:add_node({x=pos.x-i, y=pos.y+i, z=pos.z}, node)
				end
			elseif dir == "x-" then
				for i = 1, 10 do
					pos.x = pos.x - 1
					if (string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_h_bright")
					or string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_h_dark")) == nil then
						break
					end
					minetest.env:remove_node(pos)
					node.name = "infrastructure:boom_barrier_arm_v"
					minetest.env:add_node({x=pos.x+i, y=pos.y+i, z=pos.z}, node)
				end
			elseif dir == "z+" then
				for i = 1, 10 do
					pos.z = pos.z + 1
					if (string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_h_bright")
					or string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_h_dark")) == nil then
						break
					end
					minetest.env:remove_node(pos)
					node.name = "infrastructure:boom_barrier_arm_v"
					minetest.env:add_node({x=pos.x, y=pos.y+i, z=pos.z-i}, node)
				end
			elseif dir == "z-" then
				for i = 1, 10 do
					pos.z = pos.z - 1
					if (string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_h_bright")
					or string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_h_dark")) == nil then
						break
					end
					minetest.env:remove_node(pos)
					node.name = "infrastructure:boom_barrier_arm_v"
					minetest.env:add_node({x=pos.x, y=pos.y+i, z=pos.z+i}, node)
				end
			end

		elseif node.name == "infrastructure:boom_barrier_top_v" then
			minetest.swap_node(pos, {name = "infrastructure:boom_barrier_top_h", param2 = node.param2})
				if dir == "x+" then
				for i = 1, 10 do
					pos.y = pos.y + 1
					if string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_v") == nil then
						break
					end
					minetest.env:remove_node(pos)
					node.name = "infrastructure:boom_barrier_arm_h_bright"
					minetest.env:add_node({x=pos.x+i, y=pos.y-i, z=pos.z}, node)
				end
			elseif dir == "x-" then
				for i = 1, 10 do
					pos.y = pos.y + 1
					if string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_v") == nil then
						break
					end
					minetest.env:remove_node(pos)
					node.name = "infrastructure:boom_barrier_arm_h_bright"
					minetest.env:add_node({x=pos.x-i, y=pos.y-i, z=pos.z}, node)
				end
			elseif dir == "z+" then
				for i = 1, 10 do
					pos.y = pos.y + 1
					if string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_v") == nil then
						break
					end
					minetest.env:remove_node(pos)
					node.name = "infrastructure:boom_barrier_arm_h_bright"
					minetest.env:add_node({x=pos.x, y=pos.y-i, z=pos.z+i}, node)
				end
			elseif dir == "z-" then
				for i = 1, 10 do
					pos.y = pos.y + 1
					if string.match(minetest.env:get_node(pos).name, "infrastructure:boom_barrier_arm_v") == nil then
						break
					end
					minetest.env:remove_node(pos)
					node.name = "infrastructure:boom_barrier_arm_h_bright"
					minetest.env:add_node({x=pos.x, y=pos.y-i, z=pos.z-i}, node)
				end
			end
		end
	end

	minetest.register_abm( {
		nodenames = {"infrastructure:boom_barrier_arm_h_bright", "infrastructure:boom_barrier_arm_h_dark"},
		interval = 1,
		chance = 1,
		action = function(pos, node)
			local node = minetest.env:get_node(pos)
			if node.name == "infrastructure:boom_barrier_arm_h_bright" then
				minetest.swap_node(pos, {name = "infrastructure:boom_barrier_arm_h_dark", param2 = node.param2})
			elseif node.name == "infrastructure:boom_barrier_arm_h_dark" then
				minetest.swap_node(pos, {name = "infrastructure:boom_barrier_arm_h_bright", param2 = node.param2})
			end
		end
	})

	minetest.register_node("infrastructure:boom_barrier_top_h", {
		description = "Boom barrier mechanism",
		tiles = {
			"infrastructure_boom_barrier_h_top.png",
			"infrastructure_boom_barrier_h_bottom.png",
			"infrastructure_boom_barrier_h_right.png",
			"infrastructure_boom_barrier_h_left.png",
			"infrastructure_boom_barrier_h_front_back.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 1},
		node_box = {
			type = "fixed",
			fixed = {
				{-1/4, -1/4, -1/4, 1/4, 1/4, 1/4},
				{-1/8, -1/2, -1/8, 1/8, -1/4, 1/8},

				{-3/8, -1/2, -1/2, -1/4, -1/4, 1/8},
				{-3/8, -1/2, -1/8, -1/4, 1/8, 1/8},
				{-3/8, -1/8, -1/8, -1/4, 1/8, 1/2},
				{-1/2, -3/16, 1/4, -3/8, 3/16, 1/2},
				{-1/2, -1/8, 3/16, -3/8, 1/8, 1/2},
				{-1/2, -1/16, 1/8, -3/8, 1/16, 1/2},	

				{1/4, -1/2, -1/2, 3/8, -1/4, 1/8},
				{1/4, -1/2, -1/8, 3/8, 1/8, 1/8},
				{1/4, -1/8, -1/8, 3/8, 1/8, 1/2},
				{3/8, -3/16, 1/4, 1/2, 3/16, 1/2},
				{3/8, -1/8, 3/16, 1/2, 1/8, 1/2},
				{3/8, -1/16, 1/8, 1/2, 1/16, 1/2},

				{-3/8, -1/2, -1/2, 3/8, -1/4, -3/8},

				{-7/16, -1/16, -1/16, 7/16, 1/16, 1/16}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-1/4, -1/4, -1/4, 1/4, 1/4, 1/4},
				{-1/8, -1/2, -1/8, 1/8, -1/4, 1/8},

				{-3/8, -1/2, -1/2, -1/4, -1/4, 1/8},
				{-3/8, -1/2, -1/8, -1/4, 1/8, 1/8},
				{-3/8, -1/8, -1/8, -1/4, 1/8, 1/2},
				{-1/2, -3/16, 1/4, -3/8, 3/16, 1/2},
				{-1/2, -1/8, 3/16, -3/8, 1/8, 1/2},
				{-1/2, -1/16, 1/8, -3/8, 1/16, 1/2},	

				{1/4, -1/2, -1/2, 3/8, -1/4, 1/8},
				{1/4, -1/2, -1/8, 3/8, 1/8, 1/8},
				{1/4, -1/8, -1/8, 3/8, 1/8, 1/2},
				{3/8, -3/16, 1/4, 1/2, 3/16, 1/2},
				{3/8, -1/8, 3/16, 1/2, 1/8, 1/2},
				{3/8, -1/16, 1/8, 1/2, 1/16, 1/2},

				{-3/8, -1/2, -1/2, 3/8, -1/4, -3/8},

				{-7/16, -1/16, -1/16, 7/16, 1/16, 1/16}
			}
		},

		after_place_node = function(pos)
			local node = minetest.env:get_node(pos)
			node.name = "infrastructure:boom_barrier_bottom"
			minetest.env:add_node(pos, node)
			pos.y = pos.y + 1
			node.name = "infrastructure:boom_barrier_top_h"
			minetest.env:add_node(pos, node)
		end,

		after_dig_node = function(pos)
			pos.y = pos.y - 1
			minetest.env:remove_node(pos)
		end,

		on_punch = function(pos, node)
			move_arm(pos, node)
		end
	})

	minetest.register_node("infrastructure:boom_barrier_top_v", {
		tiles = {
			"infrastructure_boom_barrier_h_front_back.png",
			"infrastructure_boom_barrier_v_bottom.png",
			"infrastructure_boom_barrier_v_right.png",
			"infrastructure_boom_barrier_v_left.png",
			"infrastructure_boom_barrier_v_front_back.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 1},
		drop = "infrastructure:boom_barrier_top_h",
		node_box = {
			type = "fixed",
			fixed = {
				{-1/4, -1/4, -1/4, 1/4, 1/4, 1/4},
				{-1/8, -1/2, -1/8, 1/8, -1/4, 1/8},

				{-3/8, -1/8, -1/2, -1/4, 1/2, -1/4},
				{-3/8, -1/8, -1/2, -1/4, 1/8, 1/8},
				{-3/8, -1/2, -1/8, -1/4, 1/8, 1/8},
				{-1/2, -1/2, -3/16, -3/8, -1/4, 3/16},
				{-1/2, -1/2, -1/8, -3/8, -3/16, 1/8},
				{-1/2, -1/2, -1/16, -3/8, -1/8, 1/16},	

				{1/4, -1/8, -1/2, 3/8, 1/2, -1/4},
				{1/4, -1/8, -1/2, 3/8, 1/8, 1/8},
				{1/4, -1/2, -1/8, 3/8, 1/8, 1/8},
				{3/8, -1/2, -3/16, 1/2, -1/4, 3/16},
				{3/8, -1/2, -1/8, 1/2, -3/16, 1/8},
				{3/8, -1/2, -1/16, 1/2, -1/8, 1/16},

				{-3/8, 3/8, -1/2, 3/8, 1/2, -1/4},

				{-7/16, -1/16, -1/16, 7/16, 1/16, 1/16}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-1/4, -1/4, -1/4, 1/4, 1/4, 1/4},
				{-1/8, -1/2, -1/8, 1/8, -1/4, 1/8},

				{-3/8, -1/8, -1/2, -1/4, 1/2, -1/4},
				{-3/8, -1/8, -1/2, -1/4, 1/8, 1/8},
				{-3/8, -1/2, -1/8, -1/4, 1/8, 1/8},
				{-1/2, -1/2, -3/16, -3/8, -1/4, 3/16},
				{-1/2, -1/2, -1/8, -3/8, -3/16, 1/8},
				{-1/2, -1/2, -1/16, -3/8, -1/8, 1/16},	

				{1/4, -1/8, -1/2, 3/8, 1/2, -1/4},
				{1/4, -1/8, -1/2, 3/8, 1/8, 1/8},
				{1/4, -1/2, -1/8, 3/8, 1/8, 1/8},
				{3/8, -1/2, -3/16, 1/2, -1/4, 3/16},
				{3/8, -1/2, -1/8, 1/2, -3/16, 1/8},
				{3/8, -1/2, -1/16, 1/2, -1/8, 1/16},

				{-3/8, 3/8, -1/2, 3/8, 1/2, -1/4},

				{-7/16, -1/16, -1/16, 7/16, 1/16, 1/16}
			}
		},

		after_dig_node = function(pos)
			pos.y = pos.y - 1
			minetest.env:remove_node(pos)
		end,

		on_punch = function(pos, node)
			move_arm(pos, node)
		end
	})

	minetest.register_node("infrastructure:boom_barrier_bottom", {
		tiles = {
			"infrastructure_traffic_lights_side.png",
			"infrastructure_traffic_lights_side.png",
			"infrastructure_automatic_warning_device_bottom.png",
			"infrastructure_automatic_warning_device_bottom.png",
			"infrastructure_automatic_warning_device_bottom.png",
			"infrastructure_automatic_warning_device_bottom.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 1},
		drop = "infrastructure:boom_barrier_top_h",
		node_box = {
			type = "fixed",
			fixed = {
				{-1/16, -1/2, -1/16, 1/16, 1/2, 1/16},
				{-1/2, -1/2, -1/4, 1/2, -3/8, 1/4},
				{-1/4, -1/2, -1/2, 1/4, -3/8, 1/2},
				{-1/8, -1/2, -1/8, 1/8, 0, 1/8}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-1/16, -1/2, -1/16, 1/16, 1/2, 1/16},
				{-1/2, -1/2, -1/4, 1/2, -3/8, 1/4},
				{-1/4, -1/2, -1/2, 1/4, -3/8, 1/2},
				{-1/8, -1/2, -1/8, 1/8, 0, 1/8}
			}
		},

		after_dig_node = function(pos)
			pos.y = pos.y + 1
			minetest.env:remove_node(pos)
		end,

		mesecons = {effector = {
			action_on = function(pos, node)
				pos.y = pos.y + 1
				move_arm(pos, node)
			end,
		}}
	})

	minetest.register_node("infrastructure:boom_barrier_arm_h_bright", {
		description = "Boom barrier arm",
		tiles = {
			"infrastructure_boom_barrier_arm_h_top.png",
			"infrastructure_boom_barrier_arm_h_bottom_front_back.png",
			"infrastructure_boom_barrier_arm_h_left_right_bright.png",
			"infrastructure_boom_barrier_arm_h_left_right_bright.png",
			"infrastructure_boom_barrier_arm_h_bottom_front_back.png",
			"infrastructure_boom_barrier_arm_h_bottom_front_back.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 1},
		light_source = BOOM_BARRIER_LIGHT_RANGE,
		node_box = {
			type = "fixed",
			fixed = {
				{-1/8, -1/2, -1/2, 1/8, -7/16, 1/2},
				{-1/8, -5/16, -1/2, 1/8, -1/4, 1/2},
				{-1/8, -1/2, -1/2, -1/16, -1/4, 1/2},
				{1/16, -1/2, -1/2, 1/8, -1/4, 1/2},
				{0, -1/4, -1/8, 0, 0, 1/8}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-1/8, -1/2, -1/2, 1/8, -1/4, 1/2}
			}
		}
	})

	minetest.register_node("infrastructure:boom_barrier_arm_h_dark", {
		tiles = {
			"infrastructure_boom_barrier_arm_h_top.png",
			"infrastructure_boom_barrier_arm_h_bottom_front_back.png",
			"infrastructure_boom_barrier_arm_h_left_right_dark.png",
			"infrastructure_boom_barrier_arm_h_left_right_dark.png",
			"infrastructure_boom_barrier_arm_h_bottom_front_back.png",
			"infrastructure_boom_barrier_arm_h_bottom_front_back.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 1},
		drop = "infrastructure:boom_barrier_arm_h_bright",
		node_box = {
			type = "fixed",
			fixed = {
				{-1/8, -1/2, -1/2, 1/8, -7/16, 1/2},
				{-1/8, -5/16, -1/2, 1/8, -1/4, 1/2},
				{-1/8, -1/2, -1/2, -1/16, -1/4, 1/2},
				{1/16, -1/2, -1/2, 1/8, -1/4, 1/2},
				{0, -1/4, -1/8, 0, 0, 1/8}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-1/8, -1/2, -1/2, 1/8, -1/4, 1/2}
			}
		}
	})

	minetest.register_node("infrastructure:boom_barrier_arm_v", {
		tiles = {
			"infrastructure_boom_barrier_arm_h_bottom_front_back.png",
			"infrastructure_boom_barrier_arm_h_bottom_front_back.png",
			"infrastructure_boom_barrier_arm_v_left.png",
			"infrastructure_boom_barrier_arm_v_right.png",
			"infrastructure_boom_barrier_arm_h_top.png",
			"infrastructure_boom_barrier_arm_h_bottom_front_back.png"
		},
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 1},
		drop = "infrastructure:boom_barrier_arm_h_bright",
		node_box = {
			type = "fixed",
			fixed = {
				{-1/8, -1/2, -1/2, 1/8, 1/2, -7/16},
				{-1/8, -1/2, -5/16, 1/8, 1/2, -1/4},
				{-1/8, -1/2, -1/2, -1/16, 1/2, -1/4},
				{1/16, -1/2, -1/2, 1/8, 1/2, -1/4},
				{0, -1/8, -1/4, 0, 1/8, 0}
			}
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-1/8, -1/2, -1/2, 1/8, 1/2, -1/4}
			}
		}
	})

	minetest.register_alias("infrastructure:boom_barrier_mechanism", "infrastructure:boom_barrier_top_h")
	minetest.register_alias("infrastructure:boom_barrier_arm", "infrastructure:boom_barrier_arm_h_bright")

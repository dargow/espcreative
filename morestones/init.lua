--register node
minetest.register_node("morestones:limestone", {
    description = "Limestone",
    tiles = {"stones_plus_limestone.png"},
    is_ground_content = true,
    groups = {cracky=2, stone=1},
    legacy_mineral = true,
    sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("morestones:marble", {
    description = "Marble",
    tiles = {"mtz_marble_pink.png"},
    is_ground_content = true,
    groups = {cracky=2, stone=1},
    legacy_mineral = true,
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("morestones:slate", {
    description = "Slate",
    tiles = {"stones_plus_slate.png"},
    is_ground_content = true,
    groups = {cracky=2, stone=1},
    legacy_mineral = true,
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("morestones:travertine", {
    description = "Travertine",
    tiles = {"stones_plus_travertine.png"},
    is_ground_content = true,
    groups = {cracky=2, stone=1},
    legacy_mineral = true,
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("morestones:syenite", {
    description = "Syenite",
    tiles = {"stones_plus_syenite.png"},
    is_ground_content = true,
    groups = {cracky=2, stone=1},
    legacy_mineral = true,
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("morestones:comendite", {
    description = "Comendite",
    tiles = {"stones_plus_comendite.png"},
    is_ground_content = true,
    groups = {cracky=2, stone=1},
    legacy_mineral = true,
    sounds = default.node_sound_stone_defaults(),
})

--register ores for mapgen

dofile(minetest.get_modpath("morestones") .. "/stairs.lua")


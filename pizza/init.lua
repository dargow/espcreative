-- Pizza MOD
-- by vitaminx

NAME="Pizza MOD"
VERSION="0.3"

print(NAME.." "..VERSION)

-- items



minetest.register_node("pizza:pizzabox", {
    description = "Pizzabox",
    tiles = {
        "pizzabox_top.png",
        "pizzabox_bottom.png",
        "pizzabox_side.png",
        "pizzabox_side.png",
        "pizzabox_side.png",
        "pizzabox_side.png",
    },
    inventory_image = "pizzabox_top.png",
    groups = { dig_immediate=2 },
    paramtype = "light",
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            { -0.5, -0.5, -0.5, 0.5, -0.3, 0.5 }
        }
    }
})



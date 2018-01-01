-- Crafting for homedecor mod (includes folding) by Vanessa Ezekowitz
--
-- Mostly my own code; overall template borrowed from game default

local S = homedecor.gettext

-- misc craftitems



minetest.register_alias("homedecor:plastic_base", "homedecor:paraffin")

-- alternate crafting if mesecons is/isn't installed


-- alternate crafting if technic is/isn't installed


minetest.register_alias("homedecor:brass_ingot", "technic:brass_ingot")

-- the actual crafts


if (minetest.get_modpath("technic") and minetest.get_modpath("dye") and minetest.get_modpath("bees")) then
	technic.register_separating_recipe({ input = {"bees:wax 1"}, output = {"homedecor:oil_extract 2","dye:yellow 1"} })
end


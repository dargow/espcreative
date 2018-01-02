--[[
register_beverage({
				   name = name of your drink,
				   recipe = "put fruit for drink"
				   recipe2 = "put fruit for drink"				                Default = recipe 			       -optional
				   description = "description of your drink",             Default = None               -optional
				   liquidcolour = "colour of your liquids RGB code",      Default = White              -optional
				   wherein = "cup or glasses"                             Default = Cup                -optional
				   cuptexture = "cup texture",  			            	     	Default = Brown              -optional
				   heat = "hot or cold "                                  Default = Hot                -optional
				  })
--]]








--------------Internationalization-------
-----------------------------------------    

local S if minetest.get_modpath("intllib") 
then S = intllib.Getter() 
else S = function(s) return s end end 	     

-----------------------------------------
-----------------------------------------
-- Fruit definitions --------------------
-----------------------------------------	
----- Checks for external content, and adds support
----- Code is taken from Food mod by Rubenwardy

function beverage.support(group, item)
	if type(group) == "table" then
		for i = 1, #group do
			beverage.support(group[i], item)
		end
		return
	end
	if type(item) == "table" then
		for i = 1, #item do
			beverage.support(group, item[i])
		end
		return
	end

	local idx = string.find(item, ":")
	if idx <= 1 then
		error("[Beverage Error] beverage.support - error in item name ('" .. item .. "')")
	end
	local mod = string.sub(item, 1, idx - 1)

	if not minetest.get_modpath(mod) then
		if beverage.debug then
			print("[Beverage Debug] Mod '"..mod.."' is not installed")
		end
		return
	end

	local data = minetest.registered_items[item]
	if not data then
		print("[Beverage Warning] Item '"..item.."' not found")
		return
	end


	-- Add group
	local g = {}
	if data.groups then
		for k, v in pairs(data.groups) do
			g[k] = v
		end
	end
	g["beverage_"..group] = 1
	minetest.override_item(item, {groups = g})
end







------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------           Register drinks                    -----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------




--Coffee
register_beverage({
					name = "coffee",
					description = S("Coffee"),
					liquidcolour = "#8B4513:190",
					heat = "hot",
					wherein = "cup",
					cuptexture = "cup.png^[colorize:#CD5C5C:90",
					recipe = "coffee"
				})
				
--Milk
register_beverage({
					name = "milk",
					description = S("Milk"),
					liquidcolour = "#F8F8FF:190",
					heat = "hot",
					wherein = "cup",
					cuptexture = "cup.png^[colorize:#7171C6:90",
					recipe = "milk"
				})				
				

-- Hot Chocolate
register_beverage({
					name = "hotchocolate",
					description = S("Hot Chocolate"),
					liquidcolour = "#8B5A00:190",
					heat = "hot",
					wherein = "cup",
					recipe = "chocolate"
				})
				
				
-- Tea				
register_beverage({
					name = "tea",
					description = S("Tea"),
					liquidcolour = "#CD3700:190",
					heat = "hot",
					wherein = "cup",
					cuptexture = "cup.png^[colorize:#CDB7B5:90",
					recipe = "tea"
				})				
				
-- Green Tea				
register_beverage({
					name = "greentea",
					description = S("Green Tea"),
					liquidcolour = "#9ACD32:190",
					heat = "hot",
					wherein = "cup",
					cuptexture = "cup.png^[colorize:#CD5C5C:90",
					recipe = "flower"
				})				
	
				
-- Orange Juice
register_beverage({
					name = "orangejuice",
					description = S("Orange Juice"),
					liquidcolour = "#FFA500:110",
					heat = "cold",
					wherein = "glasses",
					cuptexture = "liquid_cold_bottom.png",
					recipe = "orange"
				})

-- Apple Juice				
register_beverage({
					name = "applejuice",
					description = S("Apple Juice"),
					liquidcolour = "#EED5B7:110",
					heat = "cold",
					wherein = "glasses",
					cuptexture = "liquid_cold_bottom.png",
					recipe = "apple"
				})

-- Berry Juice				
register_beverage({
					name = "berryjuice",
					description = S("Berry Juice"),
					liquidcolour = "#EE4000:110",
					heat = "cold",
					wherein = "glasses",
					recipe = "berry"
				})

-- Lemonade				
register_beverage({
					name = "lemonade",
					description = S("Lemonade"),
					liquidcolour = "#FFF68F:110",
					heat = "cold",
					wherein = "glasses",
					recipe = "lemon"
				})

-- Coconut Milk				
register_beverage({
					name = "coconutmilk",
					description = S("Coconut Milk"),
					liquidcolour = "#E0E0E0:110",
					heat = "cold",
					wherein = "glasses",
					recipe = "coconut"
				})
				
	-- Cold Water			
register_beverage({
					name = "drinkingwater",
					description = S("Drinking Water"),
					liquidcolour = "#518EF7:110",
					heat = "cold",
					wherein = "glasses",
					recipe = "water"
				})
				
	-- Hot Water		
register_beverage({
					name = "hotwater",
					description = S("Hot Water"),
					liquidcolour = "#518EF7:110",
					heat = "hot",
					wherein = "cup",
					recipe = "water"
				})

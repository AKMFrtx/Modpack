local function get_minable_datas()
	local result = {}
	_table.each(data.raw["resource"], function(prototype)
		local prototype_name = prototype.name
		if string.find(prototype_name, "infinite-", 1, true) then
			return
		end
		if not prototype.minable then
			return
		end
		--log("resource prototype data " .. Utils.dump_to_console(prototype.minable))
		if prototype.minable.results then
			_table.each(prototype.minable.results, function(minable_result)
				table.insert(result, {
					type = minable_result.type,
					name = minable_result.name or minable_result[1],
					required_fluid = prototype.minable.required_fluid,
					amount = prototype.minable.fluid_amount,
				})
				--log("prototype.minable.required_fluid " .. tostring(prototype.minable.required_fluid))
			end)
		end
	end)
	_table.insert_all_if_not_exists(result, {
		-- сады разных зон
		--[[{ type = "item", name = "swamp-garden" },
		{ type = "item", name = "desert-garden" },
		{ type = "item", name = "temperate-garden" },
		-- деревья различных зон
		{ type = "item", name = "temperate-tree" },
		{ type = "item", name = "swamp-tree" },
		{ type = "item", name = "desert-tree" },
		-- инопланетные артефакты
		{ type = "item", name = "small-alien-artifact" },
		{ type = "item", name = "small-alien-artifact-red" },
		{ type = "item", name = "small-alien-artifact-orange" },
		{ type = "item", name = "small-alien-artifact-yellow" },
		{ type = "item", name = "small-alien-artifact-green" },
		{ type = "item", name = "small-alien-artifact-blue" },
		{ type = "item", name = "small-alien-artifact-purple" },]]
		-- фугу
		--puffer-nest=Гнездо фугу"}
		--рыбы
		--{ type = "fish",  name = "alien-fish-1" },
		--{ type = "fish",  name = "alien-fish-2" },
		--{ type = "fish",  name = "alien-fish-3" }
	})
	return result
end

function getBasicFluidNames()
	return _table.map(
		_table.filter(get_minable_datas(), function(minable_data)
			return minable_data.type and minable_data.type == "fluid"
		end),
		function(minable_data)
			return minable_data.name
		end
	)
end

local function createBasicRecipe(basic_data, suffix)
	local resource_type = basic_data.type
	local resource_name = basic_data.name
	local resource_recipe_name = resource_name .. "-" .. suffix
	log("creating basic recipe " .. resource_recipe_name)
	log("resource data " .. Utils.dump_to_console(basic_data))
	local resourceItemPrototype = data.raw[resource_type][resource_name]
	local recipe = {
		type = "recipe",
		name = resource_recipe_name,
		icons = resourceItemPrototype.icons,
		icon = resourceItemPrototype.icon,
		icon_size = resourceItemPrototype.icon_size,
		category = "crafting-with-fluid",
		normal = {
			results = {
				{
					type = resource_type,
					name = resource_name,
					amount = 1,
				},
			},
			ingredients = {},
			enabled = false,
		},
		expensive = {
			results = {
				{
					type = resource_type,
					name = resource_name,
					amount = 1,
				},
			},
			ingredients = {},
			enabled = false,
		},
	}
	if basic_data.required_fluid then
		recipe.normal.ingredients = { { type = "fluid", name = basic_data.required_fluid, amount = basic_data.amount } }
		recipe.expensive.ingredients =
			{ { type = "fluid", name = basic_data.required_fluid, amount = basic_data.amount } }
	end
	data:extend({
		recipe,
	})
	log("basic recipe " .. resource_recipe_name .. " created")

	return recipe
end

function createResourceRecipes()
	local minable_datas = get_minable_datas()
	local result = {}
	_table.each(minable_datas, function(minable_data)
		table.insert(result, createBasicRecipe(minable_data, "minable"))
	end)
	return result
end
function createSteamRecipe()
	return createBasicRecipe({ type = "fluid", name = "steam" }, "flamable")
end

function createWaterRecipe()
	return createBasicRecipe({ type = "fluid", name = "water" }, "minable")
end

function createCoalRecipe()
	return createBasicRecipe({ type = "item", name = "coal" }, "minable")
end
function createWoodRecipe()
	return createBasicRecipe({ type = "item", name = "wood" }, "minable")
end

require("prototypes.mod_compatibility.heroturrets_script") --скрипт разжалования турелей

--###############################################################################################
-- from some corpse marker
script.on_event(defines.events.on_pre_player_died, function(event)
    local player = game.players[event.player_index]
    player.force.add_chart_tag(player.surface, {position=player.position, text='Corpse: '..player.name..'; Time: '..math.floor(game.tick/60/60/60)..':'..(math.floor(game.tick/60/60)%60), icon={type="virtual",name="signal-info"}})
end)

if (settings.global["paranoidal-disable-vanilla-evolution"] or {}).value then
    script.on_init(function() game.map_settings.enemy_evolution.enabled = false end)
end
--###############################################################################################
--код из SpilledItems
if settings.startup["item-drop"].value == true then
script.on_event(defines.events.on_entity_died, function (event)
--	on_entity_died
--	Called when an entity dies. Can be filtered using LuaEntityDiedEventFilters

--	Contains
--	entity :: LuaEntity
--	cause :: LuaEntity (optional): The entity that did the killing if available.
--	loot :: LuaInventory: The loot generated by this entity if any.
--	force :: LuaForce (optional): The force that did the killing if any.
--	damage_type :: LuaDamagePrototype (optional): The damage type if any.
	local entity = event.entity
	local surface = entity.surface
	local position = entity.position
	
	local inventories = {}
	table.insert (inventories, entity.get_inventory(defines.inventory.chest))
--	print ('defines.inventory.chest' .. defines.inventory.chest)
	table.insert (inventories, entity.get_inventory(defines.inventory.car_trunk))
--	print ('defines.inventory.car_trunk' .. defines.inventory.car_trunk)
	table.insert (inventories, entity.get_inventory(defines.inventory.turret_ammo))
--	print ('defines.inventory.turret_ammo' .. defines.inventory.turret_ammo)
	
	table.insert (inventories, entity.get_output_inventory())
	
	table.insert (inventories, entity.get_module_inventory())
	
	table.insert (inventories, entity.get_fuel_inventory())
	
	table.insert (inventories, entity.get_burnt_result_inventory())
	
	
	local grid = entity.grid -- LuaEquipmentGrid
	if grid then
		local equipments = grid.equipment -- array of LuaEquipment [R]
		for i, equipment in pairs (equipments) do
			local prototype = equipment.prototype -- LuaEquipmentPrototype [Read-only]
			local item_prototype = prototype.take_result -- LuaItemPrototype [Read-only]
			local name = item_prototype.name
			surface.spill_item_stack(position, {name = name, count=1})
		end
		grid.clear()  -- not for other mods
	end
	
	for i, inventory in pairs (inventories) do
		for j = 1, #inventory do
			local item_stack = inventory[j]
			if item_stack and item_stack.valid_for_read then
				if item_stack.grid then
					surface.spill_item_stack(position, item_stack)
				else
					local prototype = item_stack.prototype
					local stack_size = prototype.stack_size
					local name = item_stack.name
					local count = item_stack.count
--					if count >= stack_size then
--						surface.create_entity{name="item-on-ground", 
--							position=position, 
--							stack={name=name, count=count}}
--					else -- I want to split count by stacks, but not today
						surface.spill_item_stack(position, {name=name, count=count})
--					end
				end
				item_stack.clear()
			end
		end

		inventory.clear() -- not for other mods
	end
end)
end
--###############################################################################################
-- Начало мода на помпы Pumps on Landfill
if data.raw["offshore-pump"]["offshore-pump-4-placeholder"] then
for _,tile in pairs(data.raw.tile) do
	if(tile.name=="landfill" or tile.water_contained) then
		table.insert(tile.collision_mask,water_contained_layer);
	end
end

local collision_mask_util = require("collision-mask-util")
local layer = collision_mask_util.get_first_unused_layer()
collision_mask_util.add_layer(data.raw.tile["landfill"].collision_mask, layer)
collision_mask_util.add_layer(data.raw["offshore-pump"]["offshore-pump-0-placeholder"].adjacent_tile_collision_test, layer)
data.raw["offshore-pump"]["offshore-pump-0-placeholder"].adjacent_tile_collision_mask = nil
collision_mask_util.add_layer(data.raw["offshore-pump"]["offshore-pump-1-placeholder"].adjacent_tile_collision_test, layer)
data.raw["offshore-pump"]["offshore-pump-1-placeholder"].adjacent_tile_collision_mask = nil
collision_mask_util.add_layer(data.raw["offshore-pump"]["offshore-pump-2-placeholder"].adjacent_tile_collision_test, layer)
data.raw["offshore-pump"]["offshore-pump-2-placeholder"].adjacent_tile_collision_mask = nil
collision_mask_util.add_layer(data.raw["offshore-pump"]["offshore-pump-3-placeholder"].adjacent_tile_collision_test, layer)
data.raw["offshore-pump"]["offshore-pump-3-placeholder"].adjacent_tile_collision_mask = nil
collision_mask_util.add_layer(data.raw["offshore-pump"]["offshore-pump-4-placeholder"].adjacent_tile_collision_test, layer)
data.raw["offshore-pump"]["offshore-pump-4-placeholder"].adjacent_tile_collision_mask = nil
collision_mask_util.add_layer(data.raw["offshore-pump"]["offshore-pump-4-placeholder"].adjacent_tile_collision_test, layer)
data.raw["offshore-pump"]["offshore-pump-4-placeholder"].adjacent_tile_collision_mask = nil
collision_mask_util.add_layer(data.raw["offshore-pump"]["seafloor-pump-placeholder"].adjacent_tile_collision_test, layer)
data.raw["offshore-pump"]["seafloor-pump-placeholder"].adjacent_tile_collision_mask = nil
collision_mask_util.add_layer(data.raw["offshore-pump"]["seafloor-pump-2-placeholder"].adjacent_tile_collision_test, layer)
data.raw["offshore-pump"]["seafloor-pump-2-placeholder"].adjacent_tile_collision_mask = nil
collision_mask_util.add_layer(data.raw["offshore-pump"]["seafloor-pump-3-placeholder"].adjacent_tile_collision_test, layer)
data.raw["offshore-pump"]["seafloor-pump-3-placeholder"].adjacent_tile_collision_mask = nil
end
-- Конец мода на помпы Pumps on Landfill
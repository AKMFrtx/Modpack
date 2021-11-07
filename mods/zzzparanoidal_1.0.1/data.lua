require("prototypes.fuel")
require("prototypes.fish")
require("prototypes.washers")
require("prototypes.seed-extractor")
angelsmods.trigger.smelting_products["cobalt"].plate=true

require("prototypes.artillery-prototype.artillery-turret-prototype") --фикс убирающий био-арту и добовляющий новую на базе обычной

require("prototypes.beltentities") --переехало из paranoidal-tweaks_0.18.34 (sbelyakov)

require("prototypes.micro-fix") --доработка напильником всего подряд -- фиксы от Кирика

require("prototypes.mod_compatibility.heroturrets")

--перенаправляем функцию ангела на функцию боба
if not mods["angelsindustries"] then

function angelsmods.functions.OV.add_unlock(technology, recipe)
    if
      type(technology) == "string" and
      type(recipe) == "string" and
      data.raw.technology[technology] and
      data.raw.recipe[recipe]
    then
        bobmods.lib.tech.add_recipe_unlock(technology, recipe)
    end
end

end
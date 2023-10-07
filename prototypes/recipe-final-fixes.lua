local function fixup_recipe(recipe, downgrade)
  if recipe.name then recipe.name = "tiny-"..recipe.name end
  if recipe.normal then fixup_recipe(recipe.normal, downgrade) end
  if recipe.expensive then fixup_recipe(recipe.expensive, downgrade) end
  if recipe.ingredients then
    for _,ingredient in pairs(recipe.ingredients) do
      if ingredient.name == downgrade then
        ingredient.name = "tiny-"..downgrade
      else
        ingredient.amount = math.ceil(settings.startup["tiny-assembling-machine-cost"].value * ingredient.amount)
      end
    end
  end
  if recipe.result then recipe.result = "tiny-"..recipe.result end
  if recipe.results then
    for _,result in pairs(recipe.results) do
      if util.string_starts_with(result.name, "assembling-machine") then
        result.name = "tiny-"..result.name
      end
    end
  end
end

local tiny_1 = util.table.deepcopy(data.raw.recipe["assembling-machine-1"])
fixup_recipe(tiny_1, "")
log(serpent.block(tiny_1))
local tiny_2 = util.table.deepcopy(data.raw.recipe["assembling-machine-2"])
fixup_recipe(tiny_2, "assembling-machine-1")
log(serpent.block(tiny_2))
-- local tiny_3 = util.table.deepcopy(data.raw.recipe["assembling-machine-3"])
-- fixup_recipe(tiny_3, "assembling-machine-2")

data:extend{tiny_1, tiny_2, tiny_3}

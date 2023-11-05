local tiny_cost_scalar = settings.startup["tiny-assembling-machine-cost"].value

local function fixup_tiny_recipe(tiny_recipe, recipe_name)
  if tiny_recipe.ingredients then
    for _,ingredient in pairs(tiny_recipe.ingredients) do
      if ingredient.name and util.string_starts_with(ingredient.name, "assembling-machine") then
        ingredient.name = "tiny-"..ingredient.name
      elseif ingredient.amount then
        ingredient.amount = math.ceil(tiny_cost_scalar * ingredient.amount)
      else
        if util.string_starts_with(ingredient[1], "assembling-machine") then
          ingredient[1] = "tiny-"..ingredient[1]
        else
          ingredient[2] = math.ceil(tiny_cost_scalar * ingredient[2])
        end
      end
    end
  end
  tiny_recipe.icon = nil
  tiny_recipe.icons = nil
  tiny_recipe.icon_size = nil
  tiny_recipe.icon_mipmaps = nil
  if tiny_recipe.main_product then
    tiny_recipe.main_product = "tiny-"..tiny_recipe.main_product
  end
  if tiny_recipe.result then tiny_recipe.result = "tiny-"..tiny_recipe.result end
  if tiny_recipe.results then
    for _,result in pairs(tiny_recipe.results) do
      if result.name == recipe_name then
        result.name = "tiny-"..result.name
      end
    end
  end
end

local function make_tiny_recipe(recipe_name)
  local tiny_recipe = util.table.deepcopy(data.raw.recipe[recipe_name])
  tiny_recipe.name = "tiny-"..tiny_recipe.name
  if tiny_recipe.normal then fixup_tiny_recipe(tiny_recipe.normal, recipe_name) end
  if tiny_recipe.expensive then fixup_tiny_recipe(tiny_recipe.expensive, recipe_name) end
  fixup_tiny_recipe(tiny_recipe, recipe_name)
  data:extend{tiny_recipe}
end

make_tiny_recipe("assembling-machine-1")
make_tiny_recipe("assembling-machine-2")
make_tiny_recipe("assembling-machine-3")
if mods["bobassembly"] then
  make_tiny_recipe("assembling-machine-4")
  make_tiny_recipe("assembling-machine-5")
  make_tiny_recipe("assembling-machine-6")
end
if mods["space-exploration"] then
  make_tiny_recipe("se-space-assembling-machine")
end
if mods["exotic-industries"] then
  make_tiny_recipe("ei_neo-assembler")
end

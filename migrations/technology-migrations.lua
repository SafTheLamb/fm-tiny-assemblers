for index, force in pairs(game.forces) do
  local techs = force.technologies
  local recipes = force.recipes

  recipes["tiny-assembling-machine-1"].enabled = techs["automation"].researched
  recipes["tiny-assembling-machine-2"].enabled = techs["automation-2"].researched
  recipes["tiny-assembling-machine-3"].enabled = techs["automation-3"].researched
  if script.active_mods["bobassembly"] then
    recipes["tiny-assembling-machine-4"].enabled = techs["automation-4"].researched
    recipes["tiny-assembling-machine-5"].enabled = techs["automation-5"].researched
    recipes["tiny-assembling-machine-6"].enabled = techs["automation-6"].researched
  end
  if script.active_mods["space-exploration"] then
    recipes["tiny-se-space-assembling-machine"].enabled = techs["se-space-assembling"].researched
  end
  if script.active_mods["exotic-industries"] then
    recipes["tiny-ei_neo-assembler"].enabled = techs["ei_neo-assembler"].researched
  end
end

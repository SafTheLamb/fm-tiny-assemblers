local function add_tiny_unlock(tech_name, recipe)
  local technology = data.raw.technology[tech_name]
  if technology then
    table.insert(technology.effects, {type="unlock-recipe", recipe=recipe})
  end
end

add_tiny_unlock("automation", "tiny-assembling-machine-1")
add_tiny_unlock("automation-2", "tiny-assembling-machine-2")
add_tiny_unlock("automation-3", "tiny-assembling-machine-3")
if mods["bobassembly"] then
  add_tiny_unlock("automation-4", "tiny-assembling-machine-4")
  add_tiny_unlock("automation-5", "tiny-assembling-machine-5")
  add_tiny_unlock("automation-6", "tiny-assembling-machine-6")
end
if mods["space-exploration"] then
  add_tiny_unlock("se-space-assembling", "tiny-se-space-assembling-machine")
end
if mods["exotic-industries"] then
  add_tiny_unlock("ei_neo-assembler", "tiny-ei_neo-assembler")
end
if mods["Ultracube"] then
  add_tiny_unlock("cube-fabricator", "tiny-cube-fabricator")
end

local function add_unlock(techname, recipe)
  local technology = data.raw.technology[techname]
  if technology then
    table.insert(technology.effects, {type="unlock-recipe", recipe=recipe})
  end
end

add_unlock("automation", "tiny-assembling-machine-1")
add_unlock("automation-2", "tiny-assembling-machine-2")
-- add_unlock("automation-3", "tiny-assembling-machine-3")

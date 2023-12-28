local zero = string.byte('0')
local nine = string.byte('9')
local decimal = string.byte('.')

local function fixup_energy(str)
  local strlen = string.len(str)
  local energy = 0
  local suffix = ""
  -- read the number part of the energy cost
  for i=1,strlen do
    local byte = string.byte(str, i)
    if (byte < zero or byte > nine) and (byte ~= decimal) then
      energy = tonumber(string.sub(str, 1, i - 1))
      suffix = string.sub(str, i, strlen)
      break
    end
  end
  if energy > 0 then
    return tostring(0.5 * energy)..suffix
  else
    return str
  end
end

local function fixup_layer(layer, scale)
  scale = scale or 1/3
  layer.scale = scale * (layer.scale or 1)
  if layer.shift then
    layer.shift[1] = scale * layer.shift[1]
    layer.shift[2] = scale * layer.shift[2]
  end

  if layer.hr_version then
    fixup_layer(layer.hr_version, scale)
  end
end

local modules_setting = settings.startup["tiny-assembling-machine-modules"].value
local tiny_modules_scalar = 0
if modules_setting == "One (1)" then
  tiny_modules_scalar = 0.01
elseif modules_setting == "Half (x 0.5)" then
  tiny_modules_scalar = 0.5
elseif modules_setting == "Full (x 1)" then
  tiny_modules_scalar = 1
end

local function make_tiny_entity(entity_name, scale)
  local tiny_entity = util.table.deepcopy(data.raw["assembling-machine"][entity_name])
  tiny_entity.localised_name = {"", tiny_entity.localised_name or {"entity-name."..tiny_entity.name}, " ", {"entity-name.tiny-assembling-machine-suffix"}}
  tiny_entity.name = "tiny-"..tiny_entity.name
  
  tiny_entity.minable.mining_time = 0.5 * tiny_entity.minable.mining_time
  tiny_entity.minable.result = "tiny-"..tiny_entity.minable.result
  tiny_entity.max_health = 0.5 * tiny_entity.max_health + 50
  if data.raw.corpse["tiny-"..tiny_entity.corpse] then
    tiny_entity.corpse = "tiny-"..tiny_entity.corpse
  else
    tiny_entity.corpse = "small-remnants"
  end
  if data.raw.explosion["tiny-"..tiny_entity.dying_explosion] then
    tiny_entity.dying_explosion = "tiny-"..tiny_entity.dying_explosion
  end
  if tiny_entity.fast_replaceable_group then
    tiny_entity.fast_replaceable_group = "tiny-"..tiny_entity.fast_replaceable_group
  end
  if tiny_entity.next_upgrade then
    if data.raw["assembling-machine"]["tiny-"..tiny_entity.next_upgrade] then
      tiny_entity.next_upgrade = "tiny-"..tiny_entity.next_upgrade
    else
      tiny_entity.next_upgrade = nil
    end
  end

  tiny_entity.collision_box = {{-0.35, -0.35}, {0.35, 0.35}}
  tiny_entity.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
  tiny_entity.drawing_box = {{-0.5, -0.7}, {0.5, 0.5}}
  tiny_entity.alert_icon_shift = util.by_pixel(-1, -4)
  tiny_entity.scale_entity_info_icon = true
  tiny_entity.ingredient_count = 1
  tiny_entity.fluid_boxes = nil
  if tiny_entity.energy_source then
    if tiny_entity.energy_source.emissions_per_minute then
      tiny_entity.energy_source.emissions_per_minute = 0.5 * tiny_entity.energy_source.emissions_per_minute
    end
    if tiny_entity.energy_source.drain then
      tiny_entity.energy_source.drain = fixup_energy(tiny_entity.energy_source.drain)
    end
  end
  tiny_entity.energy_usage = fixup_energy(tiny_entity.energy_usage)

  -- shrink sprites
  if tiny_entity.idle_animation then
    for _,layer in pairs(tiny_entity.animation.layers) do
      fixup_layer(layer, scale)
    end
  end
  if tiny_entity.animation then
    for _,layer in pairs(tiny_entity.animation.layers) do
      fixup_layer(layer, scale)
    end
  end

  if tiny_entity.module_specification then
    tiny_entity.module_specification = (tiny_modules_scalar > 0) and
    {
      module_slots = math.ceil(tiny_modules_scalar * tiny_entity.module_specification.module_slots),
      module_info_icon_shift = {0, 0.7/3},
      module_info_icon_scale = 0.25
    } or nil
  end

  data:extend{tiny_entity}
end

if mods["exotic-industries"] then
  make_tiny_entity("ei_neo-assembler")
end
if mods["space-exploration"] then
  make_tiny_entity("se-space-assembling-machine")
end
if mods["bobassembly"] then
  make_tiny_entity("assembling-machine-6")
  make_tiny_entity("assembling-machine-5")
  make_tiny_entity("assembling-machine-4")
end
make_tiny_entity("assembling-machine-3")
make_tiny_entity("assembling-machine-2")
make_tiny_entity("assembling-machine-1")
if mods["Ultracube"] then
  make_tiny_entity("cube-fabricator", 1/2)
  local tiny_entity = data.raw["assembling-machine"]["tiny-cube-fabricator"]
  tiny_entity.collision_box = {{-0.75, -0.75}, {0.75, 0.75}}
  tiny_entity.selection_box = {{-1, -1}, {1, 1}}
  tiny_entity.drawing_box = nil
  tiny_entity.dying_explosion = "medium-explosion"
end

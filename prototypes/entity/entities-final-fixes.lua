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

local function fixup_animation(animation, scale)
  animation.scale = scale * (animation.scale or 1)

  if animation.shift then
    animation.shift[1] = scale * animation.shift[1]
    animation.shift[2] = scale * animation.shift[2]
  end

  if animation.north then
    fixup_animation(animation.north, scale)
  end
  if animation.east then
    fixup_animation(animation.east, scale)
  end
  if animation.south then
    fixup_animation(animation.south, scale)
  end
  if animation.west then
    fixup_animation(animation.west, scale)
  end
  if animation.sheet then
    fixup_animation(animation.sheet, scale)
  end
  if animation.sheets then
    for _,sheet in pairs(animation.sheets) do
      fixup_animation(sheet, scale)
    end
  end
  if animation.layers then
    for _,layer in pairs(animation.layers) do
      fixup_animation(layer, scale)
    end
  end
end

local function fixup_working_visualisation(working_visualisation, scale)
  if working_visualisation.north_animation then
    fixup_animation(working_visualisation.north_animation, scale)
  end
  if working_visualisation.east_animation then
    fixup_animation(working_visualisation.east_animation, scale)
  end
  if working_visualisation.south_animation then
    fixup_animation(working_visualisation.south_animation, scale)
  end
  if working_visualisation.west_animation then
    fixup_animation(working_visualisation.west_animation, scale)
  end
  if working_visualisation.animation then
    fixup_animation(working_visualisation.animation, scale)
  end
end

local function fixup_graphics_set(graphics_set, scale)
  if graphics_set.frozen_patch then
    fixup_animation(graphics_set.frozen_patch, scale)
  end
  if graphics_set.animation then
    fixup_animation(graphics_set.animation, scale)
  end
  if graphics_set.working_visualisations then
    for _,working_visualisation in pairs(graphics_set.working_visualisations) do
      fixup_working_visualisation(working_visualisation, scale)
    end
  end
  if graphics_set.idle_animation then
    fixup_animation(graphics_set.idle_animation, scale)
  end
end

local function fixup_alt_icon(icon_spec, scale)
  local icon_scale = 0.5 * (1 + scale)
  icon_spec.scale = icon_scale * (icon_spec.scale or 1)
  icon_spec.scale_for_many = icon_scale * (icon_spec.scale_for_many or 1)
  if icon_spec.shift then
    icon_spec.shift[1] = scale * icon_spec.shift[1]
    icon_spec.shift[2] = scale * icon_spec.shift[2]
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
  if not data.raw["assembling-machine"][entity_name] then
    return
  end

  scale = scale or (1/3)
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
  tiny_entity.alert_icon_scale = scale * (tiny_entity.alert_icon_scale or 1)

  local connector_definition = {variation=2, main_offset=util.by_pixel(scale*4.25, scale*-2.625), shadow_offset=util.by_pixel(scale*8.25, scale*1.625), show_shadow=true}
  tiny_entity.circuit_connector = circuit_connector_definitions.create_vector(
    universal_connector_template,
    {
      connector_definition,
      connector_definition,
      connector_definition,
      connector_definition
    }
  )

  if tiny_entity.icon_draw_specification == nil then
    tiny_entity.icon_draw_specification = {}
  end
  fixup_alt_icon(tiny_entity.icon_draw_specification, scale)
  if tiny_entity.icons_positioning then
    for _,icon_spec in pairs(tiny_entity.icons_positioning) do
      fixup_alt_icon(icon_spec, scale)
    end
  end
  
  tiny_entity.ingredient_count = 1
  tiny_entity.fluid_boxes = nil
  if tiny_entity.energy_source then
    if tiny_entity.energy_source.emissions_per_minute then
      for idx,emissions in pairs(tiny_entity.energy_source.emissions_per_minute) do
        tiny_entity.energy_source.emissions_per_minute[idx] = 0.5 * emissions
      end
    end
    if tiny_entity.energy_source.drain then
      tiny_entity.energy_source.drain = fixup_energy(tiny_entity.energy_source.drain)
    end
  end
  tiny_entity.energy_usage = fixup_energy(tiny_entity.energy_usage)

  -- shrink sprites
  if tiny_entity.graphics_set then
    fixup_graphics_set(tiny_entity.graphics_set, scale)
  end
  if tiny_entity.graphics_set_flipped then
    fixup_graphics_set(tiny_entity.graphics_set_flipped, scale)
  end

  if tiny_entity.module_slots then
    tiny_entity.module_slots = math.ceil(tiny_modules_scalar * tiny_entity.module_slots)
  end

  data:extend{tiny_entity}
end

if mods["exotic-industries"] then
  make_tiny_entity("ei_neo-assembler")
end
if mods["space-exploration"] then
  make_tiny_entity("se-space-assembling-machine")
end
make_tiny_entity("assembling-machine-3")
make_tiny_entity("assembling-machine-2")
make_tiny_entity("assembling-machine-1")
if mods["bobassembly"] then
  make_tiny_entity("bob-assembling-machine-6")
  make_tiny_entity("bob-assembling-machine-5")
  make_tiny_entity("bob-assembling-machine-4")
  if data.raw["assembling-machine"]["tiny-assembling-machine-3"] and data.raw["assembling-machine"]["tiny-bob-assembling-machine-4"] then
    data.raw["assembling-machine"]["tiny-assembling-machine-3"].next_upgrade = "tiny-bob-assembling-machine-4"
  end
end
if mods["Ultracube"] then
  make_tiny_entity("cube-fabricator", 1/2)
  local tiny_entity = data.raw["assembling-machine"]["tiny-cube-fabricator"]
  tiny_entity.collision_box = {{-0.75, -0.75}, {0.75, 0.75}}
  tiny_entity.selection_box = {{-1, -1}, {1, 1}}
  tiny_entity.drawing_box = nil
  tiny_entity.dying_explosion = "medium-explosion"
end

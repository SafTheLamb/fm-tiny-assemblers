local explosion_animations = require("__base__.prototypes.entity.explosion-animations")
local sounds = require("__base__.prototypes.entity.sounds")

local function string_ends_with(str, ending)
  local len = string.len(str)
  return str.sub(str, len - string.len(ending) + 1, len) == ending
end

local function fixup_target_effect(effect)
  if effect.repeat_count then effect.repeat_count = math.ceil(0.5 * effect.repeat_count) end
end

local function fixup_delivery(delivery)
  if delivery.target_effects then
    if delivery.target_effects[1] then
      for i=#delivery.target_effects,1,-1 do
        if delivery.target_effects[i].particle_name and string_ends_with(delivery.target_effects[i].particle_name, "-metal-particle-medium") or string_ends_with(delivery.target_effects[i].particle_name, "-metal-particle-big") then
          table.remove(delivery.target_effects, i)
        else
          fixup_target_effect(delivery.target_effects[i])
        end
      end
    else
      fixup_target_effect(delivery.target_effects)
    end
  end
end

local function fixup_trigger(trigger)
  if trigger.repeat_count then trigger.repeat_count = math.ceil(0.5 * trigger.repeat_count) end
  if trigger.radius then trigger.radius = 0.5 * trigger.radius end
  if trigger.distance then trigger.distance = 0.5 * trigger.distance end
  if trigger.action_delivery then
    if trigger.action_delivery[1] then
      for _,delivery in pairs(trigger.action_delivery) do
        fixup_delivery(delivery)
      end
    else
      fixup_delivery(trigger.action_delivery)
    end
  end
end

local function make_tiny_explosion(explosion_name, fixup_base)
  if data.raw.explosion[explosion_name] then
    local tiny_explosion = util.table.deepcopy(data.raw.explosion[explosion_name])
    tiny_explosion.name = "tiny-"..tiny_explosion.name
    tiny_explosion.animations = explosion_animations.small_explosion()
    tiny_explosion.sound = sounds.small_explosion
    if tiny_explosion.created_effect then
      if tiny_explosion.created_effect[1] then
        for _,trigger in pairs(tiny_explosion.created_effect) do
          fixup_trigger(trigger)
        end
      else
        fixup_trigger(tiny_explosion.created_effect)
      end
    end

    data:extend{tiny_explosion}
  end
end

make_tiny_explosion("assembling-machine-1-explosion")
make_tiny_explosion("assembling-machine-2-explosion")
make_tiny_explosion("assembling-machine-3-explosion")
if mods["bobassembly"] then
  make_tiny_explosion("assembling-machine-4-explosion")
  make_tiny_explosion("assembling-machine-5-explosion")
  make_tiny_explosion("assembling-machine-6-explosion")
end

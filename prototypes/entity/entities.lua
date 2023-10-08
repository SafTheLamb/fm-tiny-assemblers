local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend(
{
  {
    type = "assembling-machine",
    name = "tiny-assembling-machine-1",
    localised_name = {"", {"entity-name.assembling-machine-1"}, " ", {"entity-name.tiny-assembling-machine-suffix"}},
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "tiny-assembling-machine-1"},
    max_health = 150,
    corpse = "tiny-assembling-machine-1-remnants",
    dying_explosion = "tiny-assembling-machine-1-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "tiny-assembling-machine",
    next_upgrade = "tiny-assembling-machine-2",
    alert_icon_shift = util.by_pixel(-1, -4),
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
          priority="high",
          width = 108,
          height = 114,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 2),
          scale = 1/3,
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.5/3
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
          priority="high",
          width = 95,
          height = 83,
          frame_count = 1,
          line_length = 1,
          repeat_count = 32,
          draw_as_shadow = true,
          shift = util.by_pixel(8.5, 5.5),
          scale = 1/3,
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-1/hr-assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            frame_count = 1,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.5/3
          }
        }
      }
    },
    crafting_categories = {"crafting", "basic-crafting", "advanced-crafting"},
    crafting_speed = 0.5,
    ingredient_count = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 2
    },
    energy_usage = "37.5kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t1-1.ogg",
          volume = 0.4
        }
      },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },

  {
    type = "assembling-machine",
    name = "tiny-assembling-machine-2",
    localised_name = {"", {"entity-name.assembling-machine-2"}, " ", {"entity-name.tiny-assembling-machine-suffix"}},
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "tiny-assembling-machine-2"},
    max_health = 175,
    corpse = "tiny-assembling-machine-2-remnants",
    dying_explosion = "tiny-assembling-machine-2-explosion",
    alert_icon_shift = util.by_pixel(-1, -4),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "tiny-assembling-machine",
    next_upgrade = "tiny-assembling-machine-3",
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
          priority = "high",
          width = 108,
          height = 110,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 4),
          scale = 1/3,
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2.png",
            priority = "high",
            width = 214,
            height = 218,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 4),
            scale = 0.5/3
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
          priority = "high",
          width = 98,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(12, 5),
          scale = 1/3,
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2-shadow.png",
            priority = "high",
            width = 196,
            height = 163,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(12, 4.75),
            scale = 0.5/3
          }
        }
      }
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.35
        }
      },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 0.75,
    ingredient_count = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 1
    },
    energy_usage = "75kW",
    module_specification =
    {
      module_slots = 1
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },

  {
    type = "assembling-machine",
    name = "tiny-assembling-machine-3",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "tiny-assembling-machine-3"},
    max_health = 200,
    corpse = "tiny-assembling-machine-3-remnants",
    dying_explosion = "tiny-assembling-machine-3-explosion",
    alert_icon_shift = util.by_pixel(-1, -4),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.35
        }
      },
      audible_distance_modifier = 0.5,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box = {{-0.5, -0.7}, {0.5, 0.5}},
    fast_replaceable_group = "tiny-assembling-machine",
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
          priority = "high",
          width = 108,
          height = 119,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, -0.5),
          scale = 1/3,
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5/3
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
          priority = "high",
          width = 130,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(28, 4),
          scale = 1/3,
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-3/hr-assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5/3
          }
        }
      }
    },

    crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid"},
    crafting_speed = 1.25,
    ingredient_count = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 1
    },
    energy_usage = "187.5kW",
    module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  }

})
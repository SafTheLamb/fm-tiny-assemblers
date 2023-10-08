data:extend(
{
  {
    type = "corpse",
    name = "tiny-assembling-machine-1-remnants",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/assembling-machine-1/remnants/assembling-machine-1-remnants.png",
      line_length = 1,
      width = 164,
      height = 142,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0, 10/3),
      scale = 1/3,
      hr_version =
      {
        filename = "__base__/graphics/entity/assembling-machine-1/remnants/hr-assembling-machine-1-remnants.png",
        line_length = 1,
        width = 328,
        height = 282,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0, 9.5/3),
        scale = 0.5/3
      }
    })
  },

  {
    type = "corpse",
    name = "tiny-assembling-machine-2-remnants",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/assembling-machine-2/remnants/assembling-machine-2-remnants.png",
      line_length = 1,
      width = 164,
      height = 142,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0, 10/3),
      scale = 1/3,
      hr_version =
      {
        filename = "__base__/graphics/entity/assembling-machine-2/remnants/hr-assembling-machine-2-remnants.png",
        line_length = 1,
        width = 328,
        height = 282,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0, 9.5/3),
        scale = 0.5/3
      }
    })
  },

  {
    type = "corpse",
    name = "tiny-assembling-machine-3-remnants",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-neutral", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    animation = make_rotated_animation_variations_from_sheet (3,
    {
      filename = "__base__/graphics/entity/assembling-machine-3/remnants/assembling-machine-3-remnants.png",
      line_length = 1,
      width = 164,
      height = 142,
      frame_count = 1,
      variation_count = 1,
      axially_symmetrical = false,
      direction_count = 1,
      shift = util.by_pixel(0, 10/3),
      scale = 1/3,
      hr_version =
      {
        filename = "__base__/graphics/entity/assembling-machine-3/remnants/hr-assembling-machine-3-remnants.png",
        line_length = 1,
        width = 328,
        height = 282,
        frame_count = 1,
        variation_count = 1,
        axially_symmetrical = false,
        direction_count = 1,
        shift = util.by_pixel(0, 9.5/3),
        scale = 0.5/3
      }
    })
  }
  
})

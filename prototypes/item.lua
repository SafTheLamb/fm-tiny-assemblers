data:extend(
{
  {
    type = "item",
    name = "tiny-assembling-machine-1",
    icons =
    {
      {
        icon = "__tiny-assemblers__/graphics/icons/tiny.png",
        icon_size = 64, icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/icons/assembling-machine-1.png",
        icon_size = 64, icon_mipmaps = 4, scale = 0.3
      }
    },
    subgroup = "production-machine",
    order = data.raw.item["assembling-machine-1"].order,
    place_result = "tiny-assembling-machine-1",
    stack_size = 50
  },
  {
    type = "item",
    name = "tiny-assembling-machine-2",
    icons =
    {
      {
        icon = "__tiny-assemblers__/graphics/icons/tiny.png",
        icon_size = 64, icon_mipmaps = 4
      },
      {
        icon = "__base__/graphics/icons/assembling-machine-2.png",
        icon_size = 64, icon_mipmaps = 4, scale = 0.3
      }
    },
    subgroup = "production-machine",
    order = data.raw.item["assembling-machine-2"].order,
    place_result = "tiny-assembling-machine-2",
    stack_size = 50
  },
  -- {
  --   type = "item",
  --   name = "tiny-assembling-machine-3",
  --   icons =
  --   {
  --     {
  --       icon = "__tiny-assemblers__/graphics/icons/tiny.png",
  --       icon_size = 64, icon_mipmaps = 4
  --     },
  --     {
  --       icon = "__base__/graphics/icons/assembling-machine-3.png",
  --       icon_size = 64, icon_mipmaps = 4, scale = 0.4
  --     }
  --   },
  --   subgroup = "production-machine",
  --   order = data.raw.item["assembling-machine-3"].order.."-t",
  --   place_result = "tiny-assembling-machine-3",
  --   stack_size = 50
  -- }
})
data.raw.item["assembling-machine-1"].order = data.raw.item["assembling-machine-1"].order.."b"
data.raw.item["assembling-machine-2"].order = data.raw.item["assembling-machine-2"].order.."b"
data.raw.item["assembling-machine-3"].order = data.raw.item["assembling-machine-3"].order.."b"
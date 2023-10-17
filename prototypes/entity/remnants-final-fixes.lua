local function fixup_layer(layer)
  layer.scale = (layer.scale or 1) / 3
  if layer.shift then
    layer.shift[1] = layer.shift[1] / 3
    layer.shift[2] = layer.shift[2] / 3
  end

  if layer.hr_version then
    fixup_layer(layer.hr_version)
  end
end

local function fixup_layers(animation)
  if animation.layers then
    for _,layer in pairs(animation.layers) do
      fixup_layer(layer)
    end
  else
    fixup_layer(animation)
  end
end

local function make_tiny_corpse(corpse_name)
  if data.raw.corpse[corpse_name] then
    local tiny_corpse = util.table.deepcopy(data.raw.corpse[corpse_name])
    tiny_corpse.name = "tiny-"..tiny_corpse.name
    tiny_corpse.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
    tiny_corpse.tile_width = 1
    tiny_corpse.tile_height = 1

    if tiny_corpse.animation[1] then
      for _,animation in pairs(tiny_corpse.animation) do
        fixup_layers(animation)
      end
    else
      fixup_layers(tiny_corpse.animation)
    end

    data:extend{tiny_corpse}
  end
end

make_tiny_corpse("assembling-machine-1-remnants")
make_tiny_corpse("assembling-machine-2-remnants")
make_tiny_corpse("assembling-machine-3-remnants")
if mods["bobassembly"] then
  make_tiny_corpse("assembling-machine-4-remnants")
  make_tiny_corpse("assembling-machine-5-remnants")
  make_tiny_corpse("assembling-machine-6-remnants")
end

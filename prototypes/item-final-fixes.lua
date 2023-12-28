local function make_tiny_item(item_name)
  local tiny_item = util.table.deepcopy(data.raw.item[item_name])
  tiny_item.name = "tiny-"..tiny_item.name
  tiny_item.place_result = "tiny-"..tiny_item.place_result

  -- shrink the icons
  log(serpent.block(tiny_item.icons))
  local base_icons = {}
  if tiny_item.icons then
    base_icons = util.table.deepcopy(tiny_item.icons)
  else
    base_icons = {{icon=tiny_item.icon, icon_size = tiny_item.icon_size, icon_mipmaps = tiny_item.icon_mipmaps}}
  end
  local old_icon_size = (not tiny_item.icons) and tiny_item.icon_size or 64
  tiny_item.icons = {{icon = "__tiny-assemblers__/graphics/icons/tiny.png", icon_size = 64}}
  for _,base_icon in pairs(base_icons) do
    base_icon.scale = 0.7 * (base_icon.scale or 0.5) * (64 / old_icon_size)
    table.insert(tiny_item.icons, base_icon)
  end
  
  data:extend{tiny_item}

  -- change order of base assembler
  if data.raw.item[item_name].order then
    data.raw.item[item_name].order = data.raw.item[item_name].order.."-base"
  end
end

make_tiny_item("assembling-machine-1")
make_tiny_item("assembling-machine-2")
make_tiny_item("assembling-machine-3")
if mods["bobassembly"] then
  make_tiny_item("assembling-machine-4")
  make_tiny_item("assembling-machine-5")
  make_tiny_item("assembling-machine-6")
end
if mods["space-exploration"] then
  make_tiny_item("se-space-assembling-machine")
end
if mods["exotic-industries"] then
  data.raw.item["ei_neo-assembler"].order = "c[assembling-machine-3]-c"
  make_tiny_item("ei_neo-assembler")
end
if mods["Ultracube"] then
  make_tiny_item("cube-fabricator")
end

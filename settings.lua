data:extend(
  {
    {
      type = "double-setting",
      name = "tiny-assembling-machine-cost",
      setting_type = "startup",
      default_value = 0.5,
      minimum_value = 0.1,
      maximum_value = 1
    },
    {
      type = "string-setting",
      name = "tiny-assembling-machine-modules",
      setting_type = "startup",
      default_value = "One (1)",
            allowed_values = {"None (0)", "One (1)", "Half (x 0.5)", "Full (x 1)"}
    },
    {
      type = "bool-setting,
      name = "tiny-assembling-accept-fluids",
      setting_type = "startup",
      default_value = false
    },
    {
      type = "double-setting",
      name = "tiny-assembling-fluid-volume",
      setting_type = "startup",
      default_value = 0.5,
      minimum_value = 0.1,
      maximum_value = 1
    },
  })

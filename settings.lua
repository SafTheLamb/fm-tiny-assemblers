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
  }
})
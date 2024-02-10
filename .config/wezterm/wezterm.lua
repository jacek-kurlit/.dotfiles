local wezterm = require("wezterm")

local config = wezterm.config_builder()
require("tabs").setup(config)
require("key_mappings").setup(config)
require("appereance").setup(config)

return config

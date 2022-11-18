local wezterm = require 'wezterm'

return {
  -- font
  font = wezterm.font 'JetBrainsMono',
  
  -- theme
  color_scheme = 'Catppuccin Mocha',
  
   -- status
   status_update_interval = 1000,
  
  -- window
   window_padding = {
      left = 15,
      right = 10,
      top = 10,
      bottom = 7,
   },
  window_frame = {
    active_titlebar_bg = "#090909",
    font = wezterm.font 'JetBrainsMono',
    font_size = 9,
  },
  window_background_image = wezterm.config_dir .. "/backdrops/voyage.jpg",
  window_background_opacity = 1.0,
  window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
    brightness = 0.3,

    -- You can adjust the hue by scaling its value.
    -- a multiplier of 1.0 leaves the value unchanged.
    hue = 1.0,

    -- You can adjust the saturation also.
    saturation = 1.0,
  },
  window_close_confirmation = "NeverPrompt",
  automatically_reload_config = true,
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
  
  -- tabs
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = false,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,
}
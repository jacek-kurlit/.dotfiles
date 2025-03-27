local wezterm = require("wezterm")
local mux = wezterm.mux
local M = {}

function M.setup(config)
   wezterm.on("gui-startup", function(cmd)
      local _, _, window = mux.spawn_window(cmd or {})
      window:gui_window():maximize()
   end)
   wezterm.font_with_fallback({
      -- /home/jacek-kurlit/.local/share/fonts/JetBrainsMonoNerdFont-Regular.ttf, FontConfig
      -- AKA: "JetBrainsMono NF"
      "JetBrainsMono Nerd Font",

      -- <built-in>, BuiltIn
      "JetBrains Mono",

      -- /usr/share/fonts/truetype/noto/NotoColorEmoji.ttf, FontConfig
      -- Assumed to have Emoji Presentation
      -- Pixel sizes: [128]
      "Noto Color Emoji",

      -- <built-in>, BuiltIn
      "Symbols Nerd Font Mono",
   })
   config.font_size = 13.0

   -- theme
   config.color_scheme = "tokyonight"
   config.colors = {
      cursor_bg = "#3760bf",
      cursor_border = "#3760bf",
      cursor_fg = "#e1e2e7",
      tab_bar = {
         background = "Black",
      },
   }

   config.enable_wayland = false
   -- In mather of fact max_fps is ignored in wayland because it is up to composer to set frames
   config.max_fps = 120

   config.status_update_interval = 2000
   config.window_padding = {
      left = 15,
      right = 10,
      top = 10,
      bottom = 7,
   }
   config.window_frame = {
      active_titlebar_bg = "#090909",
      font = wezterm.font("JetBrainsMono Nerd Font"),
   }

   config.window_decorations = "NONE"
   config.window_close_confirmation = "NeverPrompt"
   config.automatically_reload_config = true
   config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.8 }
end

return M

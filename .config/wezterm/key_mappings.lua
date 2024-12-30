local wezterm = require("wezterm")
local act = wezterm.action
local M = {}

function M.setup(config)
   config.keys = {
      { key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
      { key = "UpArrow", mods = "SHIFT", action = act.ScrollToPrompt(-1) },
      { key = "DownArrow", mods = "SHIFT", action = act.ScrollToPrompt(1) },
      {
         key = "W",
         mods = "CTRL|SHIFT",
         action = act.ActivateKeyTable({
            name = "window_mode",
            timeout_milliseconds = 1500,
         }),
      },
      { key = "H", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
      { key = "L", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
      { key = "K", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
      { key = "J", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
   }
   config.key_tables = {

      window_mode = {
         { key = "s", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
         { key = "v", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
         { key = "q", action = act.CloseCurrentPane({ confirm = false }) },
         { key = "t", action = act.CloseCurrentTab({ confirm = false }) },
      },
   }
end

return M

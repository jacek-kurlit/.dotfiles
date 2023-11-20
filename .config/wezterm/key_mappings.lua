local act = require("wezterm").action
local M = {}

function M.setup(config)
   config.keys = {
      { key = "UpArrow", mods = "SHIFT", action = act.ScrollToPrompt(-1) },
      { key = "DownArrow", mods = "SHIFT", action = act.ScrollToPrompt(1) },
   }
end

return M

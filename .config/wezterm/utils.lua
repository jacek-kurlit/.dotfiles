local nerdfonts = require("wezterm").nerdfonts
local M = {
   icons = {
      bash = nerdfonts.md_bash,
      nvim = nerdfonts.custom_vim,
      bat = nerdfonts.md_bat,
      home = nerdfonts.md_folder_home,
      solid_rigt_arrow = nerdfonts.pl_left_hard_divider,
      thin_right_arrow = nerdfonts.pl_left_soft_divider,
   },
}
function M.basename(s)
   return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

function M.ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end

return M

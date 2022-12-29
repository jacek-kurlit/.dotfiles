-- Lualine checks the value of vim.g.colors_name (set when using :colorscheme command) to determine the theme to load. Set your colorscheme before calling setup
local lualine_ok, lualine = pcall(require, 'lualine')

if not lualine_ok then
  return
end
lualine.setup({})

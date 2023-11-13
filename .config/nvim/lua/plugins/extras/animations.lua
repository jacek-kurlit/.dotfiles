-- mini animate
if not vim.g.neovide then
  return {
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
  }
end

-- neovide
-- padding
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0

vim.g.neovide_hide_mouse_when_typing = true

-- scale
vim.g.neovide_scale_factor = 1.00
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.05)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1 / 1.05)
end)
return {}

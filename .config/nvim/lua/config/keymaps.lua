-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, description)
  local desc = description or ""
  local opts = { noremap = false, silent = true, desc = desc }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- insert mode
map("i", "<C-j>", "<down>", "move down")
map("i", "<C-k>", "<up>", "move up")
map("i", "<C-h>", "<left>", "move letf")
map("i", "<C-l>", "<right>", "move right")
map("i", "<S-Enter>", "<esc>$a", "jump to end of line")
map("i", "<C-v>", "<C-o>p", "paste in insert mode")
map("i", "<C-n>", "<C-o>o", "new line below")
map("i", "<C-p>", "<C-o>O", "new line above")

-- Better window navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Yank
map("n", "<leader>y", "<cmd>%y+<cr>", "Yank entire buffer to clipboard")

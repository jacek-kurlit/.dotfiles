-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, description)
  local opts = { noremap = true, silent = true, desc = description }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- insert mode
map("i", "<C-j>", "<down>", "move down")
map("i", "<C-k>", "<up>", "move up")
map("i", "<C-h>", "<left>", "move letf")
map("i", "<C-l>", "<right>", "move right")
map("i", "<S-Enter>", "<esc>$a", "jump to end of line")
map("i", "<C-v>", "<C-o>p", "paste in insert mode")

-- unipaired
map("n", "]<space>", "mpo<Esc>`p", "Add new line below")
map("n", "[<space>", "mpO<Esc>`p", "Add new line above")

-- multiselect
-- <C-n>/<C-N> to select next/previous word at cursor
map("n", "<A-n>", "<Plug>(VM-Add-Cursor-Down)", "Add cursor below")
map("n", "<A-N>", "<Plug>(VM-Add-Cursor-Up)", "Add cursor above")
map("n", "<C-A-S-n>", "<Plug>(VM-Select-All)", "Select all occurrences")

-- subsitute
map("n", "cr", "<cmd>lua require('substitute').operator()<cr>", "Replace with register")
map("n", "crr", "<cmd>lua require('substitute').line()<cr>", "Replace line with register")
map("n", "cR", "<cmd>lua require('substitute').eol()<cr>", "Replace till end of line with register")
map("x", "cr", "<cmd>lua require('substitute').visual()<cr>", "Replace with register")
map("n", "cx", "<cmd>lua require('substitute.exchange').operator()<cr>", "Exchange content")
map("n", "cxx", "<cmd>lua require('substitute.exchange').line()<cr>", "Exchange line content")
map("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", "Exchange selection")

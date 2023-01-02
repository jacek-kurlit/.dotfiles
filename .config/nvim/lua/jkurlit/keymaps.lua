local opts = function(description)
	description = description or ""
	return { noremap = true, silent = true, desc = description }
end
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts())
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts())
keymap("n", "<C-j>", "<C-w>j", opts())
keymap("n", "<C-k>", "<C-w>k", opts())
keymap("n", "<C-l>", "<C-w>l", opts())
keymap("n", "<C-q>", "<C-w>q", opts())
keymap("n", "<C-d>", "<C-d>zz", opts())
keymap("n", "<C-u>", "<C-u>zz", opts())
keymap("n", "n", "nzzzv", opts())
keymap("n", "N", "Nzzzv", opts())

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts())
keymap("n", "<C-Down>", ":resize +2<CR>", opts())
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts())
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts())

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts())
keymap("n", "<S-h>", ":bprevious<CR>", opts())

-- Insert --
keymap("i", "jk", "<ESC>", opts())
keymap("i", "kj", "<ESC>", opts())
keymap("i", "<C-j>", "<down>", opts())
keymap("i", "<C-k>", "<up>", opts())
keymap("i", "<C-h>", "<left>", opts())
keymap("i", "<C-l>", "<right>", opts())
keymap("i", "<C-c>", "<Esc>", opts())

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts())
keymap("v", ">", ">gv", opts())
keymap("v", "p", '"_dP', opts())

-- multiselect
-- <C-n>/<C-N> to select next/previous word at cursor
keymap("n", "<A-n>", "<Plug>(VM-Add-Cursor-Down)", opts())
keymap("n", "<A-N>", "<Plug>(VM-Add-Cursor-Up)", opts())
keymap("n", "<C-A-S-n>", "<Plug>(VM-Select-All)", opts())

-- lsp
keymap("n", "<C-p>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts())
keymap("i", "<C-p>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts())
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts("Next diagnostic"))
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts("Prev diagnostic"))

-- subsitute
keymap("n", "cr", "<cmd>lua require('substitute').operator()<cr>", opts("Replace with register"))
keymap("n", "crr", "<cmd>lua require('substitute').line()<cr>", opts("Replace line with register"))
keymap("n", "cR", "<cmd>lua require('substitute').eol()<cr>", opts("Replace till end of line with register"))
keymap("x", "cr", "<cmd>lua require('substitute').visual()<cr>", opts("Replace with register"))
keymap("n", "cx", "<cmd>lua require('substitute.exchange').operator()<cr>", opts("Exchange content"))
keymap("n", "cxx", "<cmd>lua require('substitute.exchange').line()<cr>", opts("Exchange line content"))
keymap("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", opts("Exchange selection"))

-- more textobjects to target
vim.keymap.set({ "o", "x" }, "an", "<cmd>lua require('various-textobjs').number(false)<cr>")
vim.keymap.set({ "o", "x" }, "in", "<cmd>lua require('various-textobjs').number(true)<cr>")
vim.keymap.set({ "o", "x" }, "av", "<cmd>lua require('various-textobjs').value(false)<cr>")
vim.keymap.set({ "o", "x" }, "iv", "<cmd>lua require('various-textobjs').value(true)<cr>")
vim.keymap.set({ "o", "x" }, "ak", "<cmd>lua require('various-textobjs').key(false)<cr>")
vim.keymap.set({ "o", "x" }, "ik", "<cmd>lua require('various-textobjs').key(true)<cr>")

-- intellij keynappings
keymap(
	"n",
	"<C-e>",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
	opts("Recent files")
)

-- others
-- ["af"] = "@function.outer",
-- ["if"] = "@function.inner",
-- ["aa"] = "@parameter.outer",
-- ["ia"] = "@parameter.inner",
-- ["al"] = "@loop.outer",
-- ["il"] = "@loop.inner",
-- ["ab"] = "@block.outer",
-- ["ib"] = "@block.inner",
-- ["ai"] = "@conditional.outer",
-- ["ii"] = "@conditional.inner",
-- ["ac"] = "@class.outer",
-- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },

-- used elswhere
-- ### comment line
-- gc
-- gb
-- ### LSP
-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts())
-- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts())
-- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts())
-- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts())
-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts())
-- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts())
-- keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts())
-- keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts())
-- keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts())
-- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts())
-- keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts())
-- keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts())
-- keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts())
-- keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts())
-- keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts())
-- ### autopairs
-- # insert mode
-- <A-e> fast wrap
-- ### SURROUND
-- ys - add
-- cs - change
-- ds - delete
-- ### terminal
-- <c-\> - toggle terminal

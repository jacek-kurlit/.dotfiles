local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
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
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-q>", "<C-w>q", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<leader>c", "<cmd>Bdelete %<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==g<Esc>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==g<Esc>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("i", "<C-j>", "<down>", opts)
keymap("i", "<C-k>", "<up>", opts)
keymap("i", "<C-h>", "<left>", opts)
keymap("i", "<C-l>", "<right>", opts)
keymap("i", "<C-c>", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fj", "<cmd>Telescope jumplist<cr>", opts)
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", opts)
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)
keymap("n", "<leader>fp", "<cmd>Telescope projects<cr>", opts)
keymap("n", "<leader>?", "<cmd>Telescope commands<cr>", opts)
keymap("n", "<C-e>", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", opts)

-- link visitor
keymap("n", "<leader>wb", "<cmd>VisitLinkInBuffer<cr>", opts)
keymap("n", "<leader>wc", "<cmd>VisitLinkNearCursor<cr>", opts)
-- missing config for documentation hover https://github.com/xiyaowong/link-visitor.nvim

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>o", ":NvimTreeFindFile<cr>", opts)

-- multiselect
-- <C-n>/<C-N> to select next/previous word at cursor
keymap("n", "<A-n>", "<Plug>(VM-Add-Cursor-Down)", opts)
keymap("n", "<A-N>", "<Plug>(VM-Add-Cursor-Up)", opts)
keymap("n", "<C-A-S-n>", "<Plug>(VM-Select-All)", opts)

-- used elswhere
-- ### comment line
-- gc
-- gb
-- ### LSP
-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
-- keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
-- keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
-- keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
-- keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
-- keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
-- keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
-- ### autopairs
-- # insert mode
-- <A-e> fast wrap
-- ### SURROUND
-- ys - add
-- cs - change
-- ds - delete
-- ### terminal
-- <c-\> - toggle terminal

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- set up for ufo foldings
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Disable adding comment on nect line by removing 'cro'
vim.opt.formatoptions = "jqlnt"

-- GPT env
vim.env.OPENAI_API_HOST = "api.openai.com"


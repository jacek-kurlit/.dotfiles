-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- set up for ufo foldings
vim.o.foldcolumn = "1" -- '0' is not bad

-- Disable adding comment on next line by removing 'cro'
-- vim.opt.formatoptions = "jqlnt"

-- GPT env
vim.env.OPENAI_API_HOST = "api.openai.com"

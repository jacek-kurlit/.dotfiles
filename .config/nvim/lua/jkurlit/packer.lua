-- Automatically install packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- common dependencies
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- ui
	use("kyazdani42/nvim-web-devicons") -- icons pack
	use("EdenEast/nightfox.nvim") -- colorscheme
	use("lukas-reineke/indent-blankline.nvim") -- show code indents
	use({
		"nvim-lualine/lualine.nvim", -- editor line
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }) -- bufferline
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
	})
	use("stevearc/dressing.nvim") -- better ui input and select
	use({
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})
	use("moll/vim-bbye")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("folke/todo-comments.nvim")
	use({ -- dim unused variables
		"narutoxy/dim.lua",
		requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
	})

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("hrsh7th/cmp-nvim-lua") -- lua completions
	-- noice is prowiding signature but not as good as this plugin, revert if needed
	-- use("ray-x/lsp_signature.nvim")
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim") -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- LSP diagnostics and code actions
	use("RRethy/vim-illuminate") -- word highlight

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("chrisgrieser/nvim-various-textobjs")

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("ahmedkhalf/project.nvim")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- programming tools
	use("simrat39/rust-tools.nvim")
	use("mfussenegger/nvim-dap")

	-- additional functions
	use("numToStr/Comment.nvim") -- Adds comments with commands
	use("kylechui/nvim-surround") -- Add/Delete/Change surroudings with commands
	use("windwp/nvim-autopairs")
	use("akinsho/toggleterm.nvim")
	use("xiyaowong/link-visitor.nvim") -- open links
	use("mg979/vim-visual-multi")
	use("ggandor/leap.nvim")
	use({
		"Wansmer/treesj",
		requires = { "nvim-treesitter" },
	})
	use("booperlv/nvim-gomove")
	use("gbprod/substitute.nvim")

	-- utils

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)

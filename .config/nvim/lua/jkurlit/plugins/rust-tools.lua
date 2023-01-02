local ok, rust_tools = pcall(require, "rust-tools")
local diagnostic = require("vim.diagnostic")

if not ok then
	return
end

local capabilities = require("jkurlit.plugins.lsp.handlers").capabilities

local opts = {
	tools = {
		hover_actions = {
			auto_focus = true,
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {
		on_attach = function(client, bufnr)
			local on_attach = require("jkurlit.plugins.lsp.handlers").on_attach(client, bufnr)
			local keymap_opts = { noremap = true, silent = true, buffer = bufnr }

			-- overrriding for rust
			-- its not working and lsp code action are better...
			vim.keymap.set({ "n", "v" }, "<Leader>a", rust_tools.hover_actions.hover_actions, keymap_opts)
			vim.keymap.set({ "n", "v" }, "<C-space>", rust_tools.code_action_group.code_action_group, keymap_opts)
			vim.keymap.set("n", "<Leader>cr", "<cmd>RustRunnables<cr>", keymap_opts)
			vim.keymap.set("n", "<Leader>cd", "<cmd>RustDebuggables<cr>", keymap_opts)
		end,
		settings = {
			["rust-analyzer"] = {
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate",
				},
				cargo = {
					allFeatures = true,
				},
				checkOnSave = {
					-- default: `cargo check`
					command = "clippy",
				},
				inlayHints = {
					locationLinks = false,
				},
			},
			inlayHints = {
				lifetimeElisionHints = {
					enable = true,
					useParameterNames = true,
				},
			},
		},
	},
	-- debugging stuff
	dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
}

rust_tools.setup(opts)

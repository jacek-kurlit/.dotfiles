local ok, rust_tools = pcall(require, "rust-tools")

if not ok then
	return
end

local capabilities = require("jkurlit.plugins.lsp.handlers").capabilities
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
local codelldb_adapter = {
	type = "server",
	port = "${port}",
	executable = {
		command = mason_path .. "packages/codelldb/extension/adapter/codelldb",
		args = { "--port", "${port}" },
		-- On windows you may have to uncomment this:
		-- detached = false,
	},
}

local dap_ok, dap = pcall(require, "dap")
if dap_ok then
	dap.adapters.codelldb = codelldb_adapter
	dap.configurations.rust = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	}
end

local opts = {
	tools = {
		hover_actions = {
			auto_focus = true,
		},
		runnables = {
			use_telescope = true,
		},
		on_initialized = function()
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
				pattern = { "*.rs" },
				callback = function()
					local _, _ = pcall(vim.lsp.codelens.refresh)
				end,
			})
		end,
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {
		on_attach = function(client, bufnr)
			require("jkurlit.plugins.lsp.handlers").on_attach(client, bufnr)
			local keymap_opts = { noremap = true, silent = true, buffer = bufnr }

			-- overrriding for rust
			-- its not working and lsp code action are better...
			-- vim.keymap.set({ "n", "v" }, "<Leader>a", rust_tools.hover_actions.hover_actions, keymap_opts)
			-- vim.keymap.set({ "n", "v" }, "<C-space>", rust_tools.code_action_group.code_action_group, keymap_opts)
			vim.keymap.set("n", "<Leader>cr", "<cmd>RustRunnables<cr>", keymap_opts)
			vim.keymap.set("n", "<Leader>cd", "<cmd>RustDebuggables<cr>", keymap_opts)
		end,
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				assist = {
					importEnforceGranularity = true,
					importPrefix = "crate",
				},
				lens = {
					enable = true,
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
		adapter = codelldb_adapter,
	},
}

rust_tools.setup(opts)

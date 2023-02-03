local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
	},
	-- ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
}

local opts = {
	mode = { "n", "v" }, -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["0"] = { "<cmd>Alpha<cr>", "Dashboard" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["o"] = { "<cmd>NvimTreeFindFile<cr>", "Focus in Explorer" },
	["w"] = { "<cmd>w!<CR>", "Write buffer" },
	["q"] = { "<cmd>qa<CR>", "Quit" },
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	f = {
		name = "Find",
		f = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Find files",
		},
		s = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find string" },
		j = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		t = { "<cmd>TodoTelescope <cr>", "Find TODO list" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Document symbols" },
		["?"] = { "<cmd>Telescope commands<cr>", "Commands" },
	},
	["/"] = { "<cmd>lua require 'Comment.api'.toggle.linewise.current()<cr>", "Comment line" },
	s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },

	["p"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	x = {
		name = "Open link",
		b = { "<cmd>VisitLinkInBuffer<cr>", "in buffer" },
		c = { "<cmd>VisitLinkNearCursor<cr>", "near cursor" },
		-- missing config for documentation hover https://github.com/xiyaowong/link-visitor.nvim
	},
	l = {
		name = "LSP",
		d = {
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			"Document Diagnostics",
		},
		D = {
			"<cmd>Telescope diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	r = {
		name = "Refactor",
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { ":TSJToggle<cr>", "Toggle split/join variable definition" },
	},

	d = {
		name = "Debug",
	},
	t = {
		name = "Test",
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)

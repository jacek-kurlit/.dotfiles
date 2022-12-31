local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "bash", "toml", "rust", "javascript", "json", "lua", "typescript", "css", "yaml" }, -- one of "all" or a list of languages

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = { query = "@function.outer", desc = "Outer part of function" },
				["if"] = { query = "@function.inner", desc = "Begning of function" },
				["aa"] = { query = "@parameter.outer", desc = "Outer part of argument" },
				["ia"] = { query = "@parameter.inner", desc = "Inner part of argument" },
				["al"] = { query = "@loop.outer", desc = "Outer part of loop" },
				["il"] = { query = "@loop.inner", desc = "Inner part of loop" },
				["ab"] = { query = "@block.outer", desc = "Outer part of block" },
				["ib"] = { query = "@block.inner", desc = "Inner part of block" },
				["ai"] = { query = "@conditional.outer", desc = "Outer part of condition" },
				["ii"] = { query = "@conditional.inner", desc = "Inner part of condition" },
				["ac"] = { query = "@class.outer", desc = "Outer part of class" },
				["ic"] = { query = "@class.inner", desc = "Inner part of class" },
			},
			-- You can choose the select mode (default is charwise 'v')
			--
			-- Can also be a function which gets passed a table with the keys
			-- * query_string: eg '@function.inner'
			-- * method: eg 'v' or 'o'
			-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- mapping query_strings to modes.
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = { query = "@function.outer", desc = "Next method start" },
				["]]"] = { query = "@class.outer", desc = "Next class start" },
			},
			goto_next_end = {
				["]e"] = { query = "@function.outer", desc = "Next method end" },
				["]["] = { query = "@class.outer", desc = "Next class end" },
			},
			goto_previous_start = {
				["[f"] = { query = "@function.outer", desc = "Prev method start" },
				["[["] = { query = "@class.outer", desc = "Prev class start" },
			},
			goto_previous_end = {
				["[e"] = { query = "@function.outer", desc = "Prev method end" },
				["[]"] = { query = "@class.outer", desc = "Prev class end" },
			},
		},
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})

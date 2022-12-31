require("jkurlit.plugins.lualine")
require("jkurlit.plugins.lsp")
require("jkurlit.plugins.cmp")
require("jkurlit.plugins.telescope")
require("jkurlit.plugins.nvim-tree")
require("jkurlit.plugins.treesitter")
require("jkurlit.plugins.autopairs")
require("jkurlit.plugins.gitsigns")
require("jkurlit.plugins.bufferline")
require("jkurlit.plugins.toggleterm")
require("jkurlit.plugins.projects")
require("jkurlit.plugins.rust-tools")
require("jkurlit.plugins.link-visitor")
require("jkurlit.plugins.noice")
require("jkurlit.plugins.alpha")
require("jkurlit.plugins.nvim-toggler")

-- one liners with default configuration
local safe_require = function(plugin_name, config)
	config = config or {}
	local ok, plugin = pcall(require, plugin_name)
	if not ok then
		vim.notify("Could not load plugin " .. plugin_name)
		return
	end
	plugin.setup(config)
end

safe_require("nvim-surround")
safe_require("Comment")
safe_require("indent_blankline")
safe_require("dressing")
safe_require("gomove")
safe_require("substitute")
safe_require("various-textobjs", { lookForwardLines = 30 })
safe_require("treesj", { use_default_keymaps = false })

local leap_ok, leap = pcall(require, "leap")
if not leap_ok then
	return
end
leap.add_default_mappings()
-- local ok, signature_help = pcall(require, "lsp_signature")
-- if not ok then
-- 	return
-- end
-- signature_help.setup({ select_signature_key = "<A-n>" })

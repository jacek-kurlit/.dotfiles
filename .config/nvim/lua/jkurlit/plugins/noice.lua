local ok, noice = pcall(require, "noice")

if not ok then
	return
end

noice.setup({
	-- config.lsp.signature.enabled = false
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
})

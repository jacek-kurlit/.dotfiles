local ok, toggler = pcall(require, "nvim-toggler")

if not ok then
	return
end

toggler.setup({
	inverses = {
		["vim"] = "emacs",
	},
	remove_default_keybinds = true,
})

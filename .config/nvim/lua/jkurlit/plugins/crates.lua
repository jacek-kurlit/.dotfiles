local status_ok, crates = pcall(require, "crates")
if not status_ok then
	return
end

crates.setup({
	null_ls = {
		enabled = true,
		name = "Crates",
	},
})

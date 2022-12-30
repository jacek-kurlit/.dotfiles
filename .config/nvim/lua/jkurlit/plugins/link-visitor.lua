local ok, link_visitor = pcall(require, "link-visitor")

if not ok then
  return
end

link_visitor.setup({
	silent = true, -- disable all prints, `false` by default
})

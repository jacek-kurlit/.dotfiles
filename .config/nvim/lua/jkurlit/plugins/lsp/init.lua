local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "jkurlit.plugins.lsp.mason"
require("jkurlit.plugins.lsp.handlers").setup()
require "jkurlit.plugins.lsp.null-ls"

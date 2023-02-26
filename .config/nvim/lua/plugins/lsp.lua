return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "<c-k>", mode = "i", false }
      keys[#keys + 1] = { "<leader>cr", false }
      -- add a keymap
      keys[#keys + 1] = { "gl", vim.diagnostic.open_float, mode = "n", desc = "Show line diagnostic" }
      keys[#keys + 1] = { "<leader>rr", vim.lsp.buf.rename, mode = "n", desc = "Rename variable" }
      keys[#keys + 1] = { "<leader>a", vim.lsp.buf.code_action, mode = "n", desc = "Action code" }
      keys[#keys + 1] =
        { "<c-p>", vim.lsp.buf.signature_help, mode = { "i", "n" }, desc = "Signature Help", has = "signatureHelp" }
    end,
    opts = {
      servers = {
        taplo = {},
      },
    },
  },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "plugins.extras.lang.java" },
  { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.lang.nodejs" },
}

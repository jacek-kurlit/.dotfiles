return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "html" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        html = {},
      },
    },
  },
}

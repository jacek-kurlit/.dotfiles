return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "jq" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jqls = {},
      },
    },
  },
  {
    "jrop/jq.nvim",
    keys = {
      {
        "<leader>cp",
        ":Jq<cr>",
        desc = "Preview result",
        ft = "json",
      },
    },
  },
}

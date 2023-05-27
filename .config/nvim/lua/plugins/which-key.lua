return {
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["]y"] = { name = "+yank" },
        ["[y"] = { name = "+yank" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>gd"] = { name = "+diff" },
        ["<leader>r"] = { name = "+refactor" },
        ["<leader>rs"] = { name = "+swap" },
        ["<leader>p"] = { name = "+project" },
      },
    },
  },
}

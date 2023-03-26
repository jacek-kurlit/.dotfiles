return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        modified = {
          symbol = "[+]",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "➜",
            -- Status type
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
    },
  },
  {
    "ellisonleao/glow.nvim",
    config = true,
    keys = {
      { "<leader>um", "<cmd>Glow<cr>", desc = "Preview markdown" },
    },
  },
  -- FIXME: setup is not working I dont see mapping zR with description that I have probided
  -- also folds are not created by default
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = { "kevinhwang91/promise-async" },
  --   keys = {
  --     { "zR", "<cmd>lua require('ufo').openAllFolds()<cr>", desc = "Open all foldsxx" },
  --     { "zM", "<cmd>lua require('ufo').closeAllFolds()<cr>", desc = "Close all folds" },
  --   },
  --   config = function()
  --     require("ufo").setup({
  --       provider_selector = function(_, _, _)
  --         return { "treesitter", "indent" }
  --       end,
  --     })
  --   end,
  -- },
}

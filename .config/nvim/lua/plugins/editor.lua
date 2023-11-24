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
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keymaps = {
        disable_defaults = false, -- Disable the default keymaps
        view = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diff" } },
        },
        diff1 = {
          -- Mappings in single window diff layouts
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diff" } },
        },
        diff2 = {
          -- Mappings in 2-way diff layouts
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diff" } },
        },
        diff3 = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diff" } },
        },
        diff4 = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diff" } },
        },
        file_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diff" } },
        },
        file_history_panel = {
          { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diff" } },
        },
      },
    },
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gdl", "<cmd>DiffviewOpen<cr>", desc = "Show local changes diff / resolve conflicts" },
      { "<leader>gdm", "<cmd>DiffviewOpen origin/main<cr>", desc = "Compare with origin/main" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Close diff" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory %<cr>", desc = "Show current file history" },
      { "<leader>gdH", "<cmd>DiffviewFileHistory<cr>", desc = "Show project history" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    keys = {
      {
        "<M-v>",
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        desc = "View harpoon marks",
      },
      {
        "<M-a>",
        "<cmd>lua require('harpoon.mark').add_file()<cr>",
        desc = "Mark harpoon",
      },
      {
        "<M-h>",
        "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
        desc = "Previous harpoon",
      },
      {
        "<M-l>",
        "<cmd>lua require('harpoon.ui').nav_next()<cr>",
        desc = "Next harpoon",
      },
      {
        "<M-1>",
        "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
        desc = "Go to 1 harpoon mark",
      },
      {

        "<M-2>",
        "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
        desc = "Go to 2 harpoon mark",
      },
      {

        "<M-3>",
        "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
        desc = "Go to 3 harpoon mark",
      },
    },
    config = true,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      -- highlight = {
      --   backdrop = false,
      -- },
      label = {
        style = "inline",
      },
      -- modes = {
      --   char = {
      --     -- jump_labels = true,
      --     highlight = { backdrop = false },
      --   },
      -- },
    },
  },
}

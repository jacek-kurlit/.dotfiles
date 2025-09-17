return {
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
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      label = {
        style = "inline",
      },
    },
  },
  {
    "stevearc/overseer.nvim",
    keys = function()
      return {
        { "<leader>pr", "<cmd>OverseerRun<cr>", desc = "Run task" },
        { "<leader>pl", "<cmd>OverseerToggle<cr>", desc = "Task list" },
        { "<leader>pq", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
        { "<leader>pi", "<cmd>OverseerInfo<cr>", desc = "Overseer Info" },
        { "<leader>pb", "<cmd>OverseerBuild<cr>", desc = "Task builder" },
        { "<leader>pt", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
        { "<leader>pc", "<cmd>OverseerClearCache<cr>", desc = "Clear cache" },
      }
    end,
  },
  {
    "nvim-mini/mini.files",
    opts = function(_, opts)
      opts.windows = vim.tbl_deep_extend("force", opts.windows or {}, {
        preview = true,
        width_focus = 30,
        width_preview = 80,
      })

      opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
        -- If set to false, files are moved to the trash directory
        -- To get this dir run :echo stdpath('data')
        -- ~/.local/share/neobean/mini.files/trash
        permanent_delete = false,
      })
      return opts
    end,
  },
}

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
      filesystem = {
        commands = {
          -- over write default 'delete' command to 'trash'.
          delete = function(state)
            if vim.fn.executable("trash") == 0 then
              vim.api.nvim_echo({
                { "- Trash utility not installed. Make sure to install it first\n", nil },
                { "- Or delete the `custom delete command` section in neo-tree", nil },
              }, false, {})
              return
            end
            local inputs = require("neo-tree.ui.inputs")
            local path = state.tree:get_node().path
            local msg = "Are you sure you want to trash " .. path
            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end

              vim.fn.system({ "trash", vim.fn.fnameescape(path) })
              require("neo-tree.sources.manager").refresh(state.name)
            end)
          end,
          -- Overwrite default 'delete_visual' command to 'trash' x n.
          delete_visual = function(state, selected_nodes)
            if vim.fn.executable("trash") == 0 then
              vim.api.nvim_echo({
                { "- Trash utility not installed. Make sure to install it first\n", nil },
                { "- In macOS run `brew install trash`\n", nil },
                { "- Or delete the `custom delete command` section in neo-tree", nil },
              }, false, {})
              return
            end
            local inputs = require("neo-tree.ui.inputs")

            -- Function to get the count of items in a table
            local function GetTableLen(tbl)
              local len = 0
              for _ in pairs(tbl) do
                len = len + 1
              end
              return len
            end

            local count = GetTableLen(selected_nodes)
            local msg = "Are you sure you want to trash " .. count .. " files?"
            inputs.confirm(msg, function(confirmed)
              if not confirmed then
                return
              end
              for _, node in ipairs(selected_nodes) do
                vim.fn.system({ "trash", vim.fn.fnameescape(node.path) })
              end
              require("neo-tree.sources.manager").refresh(state.name)
            end)
          end,
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
    "echasnovski/mini.files",
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

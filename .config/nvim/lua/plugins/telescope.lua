return {
  "telescope.nvim",
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<C-n>"] = require("telescope.actions").cycle_history_next,
          ["<C-p>"] = require("telescope.actions").cycle_history_prev,

          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,

          ["<CR>"] = require("telescope.actions").select_default,
          ["<C-x>"] = require("telescope.actions").select_horizontal,
          ["<C-v>"] = require("telescope.actions").select_vertical,
          ["<C-t>"] = require("telescope.actions").select_tab,

          ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
          ["<C-d>"] = require("telescope.actions").preview_scrolling_down,

          ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
          ["<PageDown>"] = require("telescope.actions").results_scrolling_down,

          ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
          ["<S-Tab>"] = require("telescope.actions").toggle_selection
            + require("telescope.actions").move_selection_better,
          ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
          ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
          ["<C-l>"] = require("telescope.actions").complete_tag,
          ["<C-_>"] = require("telescope.actions").which_key, -- keys from pressing <C-/>
        },

        n = {
          ["<esc>"] = require("telescope.actions").close,
          ["<CR>"] = require("telescope.actions").select_default,
          ["<C-x>"] = require("telescope.actions").select_horizontal,
          ["<C-v>"] = require("telescope.actions").select_vertical,
          ["<C-t>"] = require("telescope.actions").select_tab,

          ["<Tab>"] = require("telescope.actions").toggle_selection + require("telescope.actions").move_selection_worse,
          ["<S-Tab>"] = require("telescope.actions").toggle_selection
            + require("telescope.actions").move_selection_better,
          ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
          ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,

          ["j"] = require("telescope.actions").move_selection_next,
          ["k"] = require("telescope.actions").move_selection_previous,
          ["H"] = require("telescope.actions").move_to_top,
          ["M"] = require("telescope.actions").move_to_middle,
          ["L"] = require("telescope.actions").move_to_bottom,

          ["<Down>"] = require("telescope.actions").move_selection_next,
          ["<Up>"] = require("telescope.actions").move_selection_previous,
          ["gg"] = require("telescope.actions").move_to_top,
          ["G"] = require("telescope.actions").move_to_bottom,

          ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
          ["<C-d>"] = require("telescope.actions").preview_scrolling_down,

          ["<PageUp>"] = require("telescope.actions").results_scrolling_up,
          ["<PageDown>"] = require("telescope.actions").results_scrolling_down,

          ["?"] = require("telescope.actions").which_key,
        },
      },
    },
  },
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    {
      "nvim-telescope/telescope-media-files.nvim",
      config = function()
        require("telescope").load_extension("media_files")
      end,
      keys = {
        { "<leader>fi", "<cmd>Telescope media_files<cr>", desc = "Find images" },
      },
    },
    {
      "gbprod/yanky.nvim",
      keys = {
        { "<leader>sy", "<cmd>Telescope yank_history<cr>", desc = "Search yank history" },
      },
      config = function()
        require("yanky").setup({})
        require("telescope").load_extension("yank_history")
      end,
    },
    {
      "ahmedkhalf/project.nvim",
      lazy = false,
      keys = {
        { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Find projects" },
      },
      config = function()
        local proj = require("project_nvim")
        proj.setup({
          -- on_config_done = nil,
          ---@usage patterns used to detect root dir, when **"pattern"** is in detection_methods
          detection_methods = { "lsp", "pattern" },
          patterns = {
            ".git",
            "_darcs",
            ".hg",
            ".bzr",
            ".svn",
            "Makefile",
            "package.json",
            "Cargo.toml",
            "pom.xml",
            ".nvim_project",
          },
        })
        proj.get_recent_projects()
        require("telescope").load_extension("projects")
      end,
    },
  },
}

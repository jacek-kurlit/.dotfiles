return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "debugloop/telescope-undo.nvim",
        event = "VeryLazy",
        config = function()
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("undo")
          end)
        end,
        keys = {
          { "<leader>bu", "<cmd>Telescope undo<cr>", desc = "Undo list" },
        },
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
          require("telescope").load_extension("frecency")
        end,
        keys = {
          { "<C-e>", "<Cmd>Telescope frecency workspace=CWD<CR>", "Recent files" },
        },
      },
    },
  },
}

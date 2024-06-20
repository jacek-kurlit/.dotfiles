return {
  {
    "telescope.nvim",
    keys = {
      { "<C-e>", "<Cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<CR>", "Recent files" },
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
    },
  },
}

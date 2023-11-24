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
        "ahmedkhalf/project.nvim",
        opts = {
          manual_mode = true,
          -- Methods of detecting the root directory. **"lsp"** uses the native neovim
          -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
          -- order matters: if one is not detected, the other is used as fallback. You
          -- can also delete or rearangne the detection methods.
          detection_methods = { "pattern", "lsp" },
          patterns = { ".git", ".svn", "Makefile", "package.json", "Cargo.toml" },
          -- Don't calculate root dir on specific directories
          -- Ex: { "~/.cargo/*", ... }
          exclude_dirs = { "~/.cargo/*", "~/.rustup/*", "~/.local/share/nvim/site/pack/packer/*" },
        },
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

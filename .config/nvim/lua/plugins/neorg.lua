return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              work = "~/notes/work",
              personal = "~/notes/personal",
              norg_ref = "~/notes/norg_ref",
            },
            default_workspace = "work",
          },
        },
        ["core.qol.toc"] = {
          config = {
            close_after_use = true,
          },
        },
        ["core.keybinds"] = {
          config = {
            -- defaults are here https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
            default_keybinds = true,
            neorg_leader = "<leader>n",
          },
        },
      },
    },
    keys = {
      { "<leader>nw", "<cmd>Neorg workspace work<cr>", desc = "Open work notes" },
      { "<leader>np", "<cmd>Neorg workspace personal<cr>", desc = "Open personal notes" },
      { "<leader>nc", "<cmd>Neorg return<cr>", desc = "Closes notes" },
      { "<leader>ng", "<cmd>Neorg toc right<cr>", desc = "Generate table of content" },
      -- TODO: override default Neorg bindings because they require localleader to use
      -- bind them here under <leader>n
    },
  },
}

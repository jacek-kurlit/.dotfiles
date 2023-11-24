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
            },
            default_workspace = "work",
          },
        },
      },
    },
    keys = {
      { "<leader>nn", "<cmd>Neorg index<cr>", desc = "Open default notes" },
      { "<leader>nw", "<cmd>Neorg workspace work<cr>", desc = "Open work notes" },
      { "<leader>np", "<cmd>Neorg workspace personal<cr>", desc = "Open personal notes" },
      { "<leader>nc", "<cmd>Neorg return<cr>", desc = "Closes notes" },
      -- TODO: override default Neorg bindings because they require localleader to use
      -- bind them here under <leader>n
    },
  },
}

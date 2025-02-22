return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<C-e>", "<Cmd>lua Snacks.picker.buffers({sort_lastused=true})<CR>", "Recent files" },
    },
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<Tab>"] = { "list_down", mode = { "i", "n" } },
              ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
              ["<C-Space>"] = { "select_and_next", mode = { "i", "n" } },
            },
          },
        },
      },
    },
  },
}

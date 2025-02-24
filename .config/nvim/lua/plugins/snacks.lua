return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<C-e>", "<Cmd>lua Snacks.picker.buffers({sort_lastused=true})<CR>", "Recent files" },
      {
        "<leader>o",
        function()
          local explorer_pickers = Snacks.picker.get({ source = "explorer" })
          for _, v in pairs(explorer_pickers) do
            if v:is_focused() then
              v:close()
            else
              v:focus()
            end
          end
          if #explorer_pickers == 0 then
            Snacks.picker.explorer()
          end
        end,
        "Focus on current file in explorer",
      },
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

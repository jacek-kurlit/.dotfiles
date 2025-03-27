return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "anthropic",
          slash_commands = {
            ["file"] = {
              opts = {
                provider = "snacks",
              },
            },
            ["buffer"] = {
              opts = {
                provider = "snacks",
              },
            },
          },
        },
        inline = {
          adapter = "anthropic",
        },
      },
    },
    init = function()
      require("plugins.extras.ai.code_companion_spinner"):init()
    end,
    keys = {
      { "<leader>vc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle chat buffer", mode = { "n", "v" } },
      { "<leader>vn", "<cmd>CodeCompanionChat<cr>", desc = "New chat buffer", mode = { "n", "v" } },
      { "<leader>vp", "<cmd>CodeCompanionChat Add<cr>", desc = "Put selection into chat buffer", mode = { "v" } },
      { "<leader>va", "<cmd>CodeCompanionActions<cr>", desc = "Actions", mode = { "n", "v" } },
      { "<leader>vi", "<cmd>CodeCompanion<cr>", desc = "Inline prompt", mode = { "n" } },
      { "<leader>vi", ":'<,'>CodeCompanion<cr>", desc = "Inline prompt with selection", mode = { "v" } },
      { "<leader>vt", "<cmd>CodeCompanion /tests<cr>", desc = "Create tests for selection", mode = { "v" } },
      { "<leader>vf", "<cmd>CodeCompanion /fix<cr>", desc = "Fix selection", mode = { "v" } },
      { "<leader>ve", "<cmd>CodeCompanion /explain<cr>", desc = "Explain selection", mode = { "v" } },
      { "<leader>vd", "<cmd>CodeCompanion /lsp<cr>", desc = "Explain lsp diagnostic ", mode = { "n", "v" } },
      { "<leader>vw", "<cmd>CodeCompanion /cw<cr>", desc = "I want you to", mode = { "n", "v" } },
    },
  },
}

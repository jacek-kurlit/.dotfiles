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
      prompt_library = {
        ["Code Expert"] = {
          strategy = "chat",
          description = "Get some special advice from an LLM",
          opts = {
            modes = { "v" },
            short_name = "expert",
            auto_submit = true,
            stop_context_insertion = true,
            user_prompt = false,
            ignore_system_prompt = true,
          },
          prompts = {
            {
              role = "system",
              visible = true,
              content = function(context)
                return "I want you to act as a senior "
                  .. context.filetype
                  .. " developer. I will ask you specific questions and I want you to return concise explanations and codeblock examples."
              end,
            },
            {
              role = "user",
              content = function(context)
                local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

                return "I have the following code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
              end,
              opts = {
                contains_code = true,
              },
            },
          },
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
      { "<leader>vd", "<cmd>CodeCompanion /lsp<cr>", desc = "Explain lsp diagnostic ", mode = { "n", "v" } },
      { "<leader>vw", "<cmd>CodeCompanion /cw<cr>", desc = "I want you to", mode = { "n", "v" } },
    },
  },
}

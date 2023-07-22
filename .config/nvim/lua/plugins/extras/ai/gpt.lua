return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    opts = {
      chat = {
        keymaps = {
          close = { "<C-c>" },
          yank_last = "<C-y>",
          yank_last_code = "<C-k>",
          scroll_up = "<C-u>",
          scroll_down = "<C-d>",
          new_session = "<C-n>",
          cycle_windows = "<Tab>",
          cycle_modes = "<C-f>",
          select_session = "<cr>",
          rename_session = "r",
          delete_session = "d",
          draft_message = "<C-x>",
          toggle_settings = "<C-o>",
          toggle_message_role = "<C-r>",
          toggle_system_role_open = "<C-s>",
        },
      },
      popup_input = {
        submit = "<S-Enter>",
        submit_n = "<Enter>",
      },
      openai_params = {
        model = "gpt-4",
        max_tokens = 400,
      },
    },
    -- stylua: ignore
    keys = {
      {
        "<leader>vc", "<cmd>ChatGPT<CR>", desc = "Open chat",
      },
      {
        "<leader>vp", "<cmd>ChatGPTActAs<CR>", desc = "Awesome prompts",
      },
      {
        "<leader>ve", "<cmd>ChatGPTEditWithInstructions<CR>", mode = "v", desc = "Edit selected",
      }
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}

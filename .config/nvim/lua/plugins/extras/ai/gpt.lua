return {
  {
    "jackMort/ChatGPT.nvim",
    cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions" },
    opts = {
      api_key_cmd = "pass openai/api_key",
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
        model = "gpt-4-1106-preview",
        max_tokens = 1000,
      },
      openai_edit_params = {
        model = "gpt-4-1106-preview",
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
        "<leader>ve", "<cmd>ChatGPTEditWithInstructions<CR>", mode = { "n","v" }, desc = "Edit selected",
     },
    {"<leader>vg", "<cmd>ChatGPTRun grammar_correction<CR>",desc= "Grammar Correction", mode = { "n", "v" } },
    {"<leader>vt", "<cmd>ChatGPTRun translate<CR>",desc= "Translate", mode = { "n", "v" } },
    {"<leader>vd", "<cmd>ChatGPTRun docstring<CR>",desc= "Docstring", mode = { "n", "v" } },
    {"<leader>vt", "<cmd>ChatGPTRun add_tests<CR>",desc= "Add Tests", mode = { "n", "v" } },
    {"<leader>vo", "<cmd>ChatGPTRun optimize_code<CR>",desc= "Optimize Code", mode = { "n", "v" } },
    {"<leader>vs", "<cmd>ChatGPTRun summarize<CR>",desc= "Summarize", mode = { "n", "v" } },
    {"<leader>vb", "<cmd>ChatGPTRun fix_bugs<CR>",desc= "Fix Bugs", mode = { "n", "v" } },
    {"<leader>vx", "<cmd>ChatGPTRun explain_code<CR>",desc= "Explain Code", mode = { "n", "v" } },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}

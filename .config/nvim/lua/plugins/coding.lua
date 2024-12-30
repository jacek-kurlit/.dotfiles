return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      callhierarchy = {
        show_detail = true,
      },
      lightbulb = {
        -- Flickering comes from setting this to "enable". Signcolumn is redrawn for example because of lspsaga to show lightbulb icon
        -- This causes mass fliockering maybe this is some kind of bug?
        enable = false,
      },
      rename = {
        keys = {
          quit = "<C-c>",
        },
      },
    },
    keys = {
      { "gh", "<cmd>Lspsaga finder<CR>", desc = "Symbol usages" },
      { "]D", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic with action" },
      { "[D", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic with action" },
      { "gv", "<cmd>Lspsaga peek_definition<CR>", desc = "View definition" },
      { "gV", "<cmd>Lspsaga peek_type_definition<CR>", desc = "View type definition" },
      { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostic" },
      { "gi", "<cmd>Lspsaga finder imp<CR>", desc = "Show impelentations" },
      --
      { "<leader>a", mode = { "n", "v" }, "<cmd>Lspsaga code_action<CR>", desc = "Code action" },
      { "<leader>rr", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
      { "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", desc = "Incoming calls" },
      { "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", desc = "Outgoing calls" },
    },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
        end,
      },
    },
  },
  {
    "Saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
    },
  },
}

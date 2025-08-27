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
    opts = function(_, opts)
      opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
        providers = {
          path = {
            name = "Path",
            module = "blink.cmp.sources.path",
            score_offset = 25,
            -- When typing a path, I would get snippets and text in the
            -- suggestions, I want those to show only if there are no path
            -- suggestions
            fallbacks = { "snippets", "buffer" },
            opts = {
              trailing_slash = false,
              label_trailing_slash = true,
              get_cwd = function(context)
                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
              end,
              show_hidden_files_by_default = true,
            },
          },
          buffer = {
            name = "Buffer",
            enabled = true,
            max_items = 3,
            module = "blink.cmp.sources.buffer",
            min_keyword_length = 2,
            score_offset = 40, -- the higher the number, the higher the priority
          },
        },
      })
      opts.keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      }
    end,
  },
  {
    "echasnovski/mini.splitjoin",
    opts = {
      mappings = {
        toggle = "",
        split = "<leader>rs",
        join = "<leader>rj",
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "echasnovski/mini.pairs",
    enable = false,
  },
}

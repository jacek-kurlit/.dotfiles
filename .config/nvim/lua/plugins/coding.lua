-- NOTE: Specify the trigger character(s) used for luasnip
local trigger_text = ";"
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
          snippets = {
            name = "snippets",
            enabled = true,
            max_items = 10,
            min_keyword_length = 1,
            module = "blink.cmp.sources.snippets",
            score_offset = 85, -- the higher the number, the higher the priority
            -- Only show snippets if I type the trigger_text characters, so
            -- to expand the "bash" snippet, if the trigger_text is ";" I have to
            should_show_items = function()
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
              -- NOTE: remember that `trigger_text` is modified at the top of the file
              return before_cursor:match(trigger_text .. "%w*$") ~= nil
            end,
            -- After accepting the completion, delete the trigger_text characters
            -- from the final inserted text
            transform_items = function(_, items)
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local before_cursor = vim.api.nvim_get_current_line():sub(1, col)
              local trigger_pos = before_cursor:find(trigger_text .. "[^" .. trigger_text .. "]*$")
              if trigger_pos then
                for _, item in ipairs(items) do
                  item.textEdit = {
                    newText = item.insertText or item.label,
                    range = {
                      start = { line = vim.fn.line(".") - 1, character = trigger_pos - 1 },
                      ["end"] = { line = vim.fn.line(".") - 1, character = col },
                    },
                  }
                end
              end
              -- NOTE: After the transformation, I have to reload the luasnip source
              -- Otherwise really crazy shit happens and I spent way too much time
              -- figurig this out
              -- vim.schedule(function()
              --   require("blink.cmp").reload("snippets")
              -- end)
              return items
            end,
          },
          buffer = {
            name = "Buffer",
            enabled = true,
            max_items = 3,
            module = "blink.cmp.sources.buffer",
            min_keyword_length = 3,
            score_offset = 30, -- the higher the number, the higher the priority
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
    "echasnovski/mini.pairs",
    enable = false,
    -- opts = {
    --   skip_next = [=[[%w%%%'%[%)%>%"%.%`%$]]=],
    --   skip_ts = { "string", "self_parameter", "lifetime", "type", "reference_type" },
    -- },
  },
}

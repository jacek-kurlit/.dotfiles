return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Next method start" },
            ["]p"] = { query = "@parameter.outer", desc = "Next parameter start" },
          },
          goto_next_end = {
            ["]F"] = { query = "@function.outer", desc = "Next method end" },
            ["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "Prev method start" },
            ["[p"] = { query = "@parameter.outer", desc = "Prev parameter start" },
          },
          goto_previous_end = {
            ["[F"] = { query = "@function.outer", desc = "Prev method end" },
            ["[P"] = { query = "@parameter.outer", desc = "Prev parameter end" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>rsf"] = { query = "@function.outer", desc = "Swap with next function" },
            ["<leader>rsp"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
          },
          swap_previous = {
            ["<leader>rsF"] = { query = "@function.outer", desc = "Swap with previous function" },
            ["<leader>rsP"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
          },
        },
      }
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
    end,
  },
  {
    "echasnovski/mini.ai",
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          k = ai.gen_spec.treesitter({ a = "@assignment.outer", i = "@assignment.lhs" }, {}),
          v = ai.gen_spec.treesitter({ a = "@assignment.inner", i = "@assignment.rhs" }, {}),
          d = ai.gen_spec.treesitter({ a = "@number.inner", i = "@number.inner" }, {}),
          e = ai.gen_spec.treesitter({ a = "@call.outer", i = "@call.inner" }, {}),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
      -- register all text objects with which-key
      if require("lazyvim.util").has("which-key.nvim") then
        ---@type table<string, string|table>
        local i = {
          [" "] = "Whitespace",
          ['"'] = 'Balanced "',
          ["'"] = "Balanced '",
          ["`"] = "Balanced `",
          ["("] = "Balanced (",
          [")"] = "Balanced ) including white-space",
          [">"] = "Balanced > including white-space",
          ["<lt>"] = "Balanced <",
          ["]"] = "Balanced ] including white-space",
          ["["] = "Balanced [",
          ["}"] = "Balanced } including white-space",
          ["{"] = "Balanced {",
          ["?"] = "User Prompt",
          _ = "Underscore",
          a = "Argument",
          b = "Balanced ), ], }",
          c = "Class",
          d = "Decimal/Integer",
          e = "Execution (call)",
          f = "Function",
          k = "Key (lhs)",
          o = "Block, conditional, loop",
          q = "Quote `, \", '",
          v = "Value (lhr)",
          t = "Tag",
        }
        local a = vim.deepcopy(i)
        for k, v in pairs(a) do
          a[k] = v:gsub(" including.*", "")
        end

        local ic = vim.deepcopy(i)
        local ac = vim.deepcopy(a)
        for key, name in pairs({ n = "Next", l = "Last" }) do
          i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
          a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
        end
        require("which-key").register({
          mode = { "o", "x" },
          i = i,
          a = a,
        })
      end
    end,
  },
}

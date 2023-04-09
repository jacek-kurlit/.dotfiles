return {
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    opts = {
      callhierarchy = {
        show_detail = true,
      },
    },
    keys = {
      { "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "Symbol usages" },
      { "]D", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic with action" },
      { "[D", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic with action" },
      { "gp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },
      { "gP", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek type definition" },
      { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostic" },
      { "<leader>a", mode = { "n", "v" }, "<cmd>Lspsaga code_action<CR>", desc = "Code action" },
      { "<leader>rr", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
      { "<leader>cs", "<cmd>Lspsaga outline<CR>", desc = "Code structure" },
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
    "nvim-neotest/neotest",
    config = function()
      require("neotest").setup({
        output = {
          enabled = true,
          open_on_run = "short",
        },
        icons = {
          failed = "",
          passed = "",
          running = "",
          skipped = "",
          unknown = "",
        },
        adapters = {
          require("neotest-rust"),
        },
      })
    end,
    keys = {
      { "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run nearest test" },
      { "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop nearest test" },
      { "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", desc = "Debug nearest test" },
      { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach to nearest test" },
      { "<leader>tos", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Toggle test summary" },
      { "<leader>too", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Open test result" },
      { "<leader>tot", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle output panel" },
      {
        "<leader>toh",
        "<cmd>lua require('neotest').output_panel.open({ open_win = function() vim.cmd('vsplit') end })<cr>",
        desc = "Open output panel as horizontal split",
      },
      {
        "<leader>tf",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
        desc = "Run test in current file",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      -- this requires cargo-nextest
      "rouge8/neotest-rust",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local function jumpable(dir)
        local luasnip_ok, luasnip = pcall(require, "luasnip")
        if not luasnip_ok then
          return false
        end

        local win_get_cursor = vim.api.nvim_win_get_cursor
        local get_current_buf = vim.api.nvim_get_current_buf

        ---sets the current buffer's luasnip to the one nearest the cursor
        ---@return boolean true if a node is found, false otherwise
        local function seek_luasnip_cursor_node()
          -- TODO(kylo252): upstream this
          -- for outdated versions of luasnip
          if not luasnip.session.current_nodes then
            return false
          end

          local node = luasnip.session.current_nodes[get_current_buf()]
          if not node then
            return false
          end

          local snippet = node.parent.snippet
          local exit_node = snippet.insert_nodes[0]

          local pos = win_get_cursor(0)
          pos[1] = pos[1] - 1

          -- exit early if we're past the exit node
          if exit_node then
            local exit_pos_end = exit_node.mark:pos_end()
            if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
              snippet:remove_from_jumplist()
              luasnip.session.current_nodes[get_current_buf()] = nil

              return false
            end
          end

          node = snippet.inner_first:jump_into(1, true)
          while node ~= nil and node.next ~= nil and node ~= snippet do
            local n_next = node.next
            local next_pos = n_next and n_next.mark:pos_begin()
            local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
              or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

            -- Past unmarked exit node, exit early
            if n_next == nil or n_next == snippet.next then
              snippet:remove_from_jumplist()
              luasnip.session.current_nodes[get_current_buf()] = nil

              return false
            end

            if candidate then
              luasnip.session.current_nodes[get_current_buf()] = node
              return true
            end

            local ok
            ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
            if not ok then
              snippet:remove_from_jumplist()
              luasnip.session.current_nodes[get_current_buf()] = nil

              return false
            end
          end

          -- No candidate, but have an exit node
          if exit_node then
            -- to jump to the exit node, seek to snippet
            luasnip.session.current_nodes[get_current_buf()] = snippet
            return true
          end

          -- No exit node, exit from snippet
          snippet:remove_from_jumplist()
          luasnip.session.current_nodes[get_current_buf()] = nil
          return false
        end

        if dir == -1 then
          return luasnip.in_snippet() and luasnip.jumpable(-1)
        else
          return luasnip.in_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable(1)
        end
      end
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      local luasnip = require("luasnip")
      local cmp = require("cmp")
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority_weight = 1000 },
        { name = "luasnip", priority_weight = 750 },
        { name = "buffer", priority_weight = 500 },
        { name = "path", priority_weight = 250 },
      })

      local compare = require("cmp.config.compare")
      opts.sorting = {
        priority_weight = 1.0,
        comparators = {
          -- compare.score_offset, -- not good at all
          compare.exact,
          compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
          compare.locality,
          compare.recently_used,
          -- compare.kind,
          compare.offset,
          compare.order,
          -- compare.scopes, -- what?
          -- compare.sort_text,
          -- compare.length, -- useless
        },
      }
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif jumpable(1) then
            luasnip.jump(1)
          elseif has_words_before() then
            -- cmp.complete()
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    keys = {
      {
        "<leader>rm",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
        mode = "v",
        desc = "Extract method",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>rM",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
        mode = "v",
        desc = "Extract method to file",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>rv",
        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
        mode = "v",
        desc = "Extract variable",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>rb",
        [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
        mode = { "n" },
        desc = "Extract block",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>rB",
        [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
        mode = { "n" },
        desc = "Extract block to file",
        { noremap = true, silent = true, expr = false },
      },
      {
        "<leader>ri",
        [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
        mode = "n",
        desc = "Inline variable",
        { noremap = true, silent = true, expr = false },
      },
    },
    config = true,
  },
}

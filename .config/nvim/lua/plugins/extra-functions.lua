return {
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "ma", -- Add surrounding in Normal and Visual modes
        delete = "md", -- Delete surrounding
        replace = "mr", -- Replace surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
      },
    },
  },
  {
    "xiyaowong/link-visitor.nvim",
    opts = {
      silent = true,
    },
    keys = {
      { "<leader>fl", "<cmd>VisitLinkInBuffer<cr>", desc = "Links in buffer" },
    },
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) then
        require("lazy").load({ plugins = { "vim-visual-multi" } })
      end
    end,
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
    },
    keys = {
      { "<leader>rj", ":TSJToggle<cr>", desc = "Toggle join/split variable definition" },
    },
  },
  {
    "gbprod/substitute.nvim",
    config = true,
  },
  {
    "nacro90/numb.nvim",
    config = true,
  },
  {
    "monaqa/dial.nvim",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.constant.alias.bool,
          augend.constant.new({
            elements = { "and", "or" },
            word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
            cyclic = true, -- "or" is incremented into "and".
          }),
          augend.constant.new({
            elements = { "&&", "||" },
            word = false,
            cyclic = true,
          }),
          augend.constant.new({
            elements = { "<=", "=", ">=" },
            word = true,
            cyclic = true,
          }),

          augend.constant.new({
            elements = { "private", "protected", "public" },
            word = true,
            cyclic = true,
          }),
          augend.date.alias["%d.%m.%Y"],
          augend.date.alias["%d.%m."],
          augend.date.alias["%H:%M"],
        },
      })
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), opts)
      vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), opts)
      vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual(), opts)
      vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual(), opts)
      vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual(), opts)
      vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual(), opts)
    end,
  },
}

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
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) then
        require("lazy").load({ plugins = { "vim-visual-multi" } })
      end
    end,
  },
  {
    "gbprod/substitute.nvim",
    config = true,
  },
  {
    "nacro90/numb.nvim",
    config = true,
  },
}

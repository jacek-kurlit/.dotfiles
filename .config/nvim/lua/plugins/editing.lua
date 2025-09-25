return {
  {
    "nvim-mini/mini.surround",
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
    "gbprod/substitute.nvim",
    config = true,
    keys = {
      { "cr", "<cmd>lua require('substitute').operator()<cr>", desc = "Replace with register" },
      { "crr", "<cmd>lua require('substitute').line()<cr>", desc = "Replace line with register" },
      { "cR", "<cmd>lua require('substitute').eol()<cr>", desc = "Replace till end of line with register" },
      { "cx", "<cmd>lua require('substitute.exchange').operator()<cr>", desc = "Exchange content" },
      { "cxx", "<cmd>lua require('substitute.exchange').line()<cr>", desc = "Exchange line content" },
      { "cr", "<cmd>lua require('substitute').visual()<cr>", mode = "x", desc = "Replace with register" },
      { "X", "<cmd>lua require('substitute.exchange').visual()<cr>", mode = "x", desc = "Exchange selection" },
    },
  },
  {
    "nacro90/numb.nvim",
    config = true,
  },
}

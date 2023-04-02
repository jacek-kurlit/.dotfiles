return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local Util = require("lazyvim.util")
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>d"] = { name = "+debug" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>gd"] = { name = "+diff" },
        ["<leader>q"] = { name = "+quit/session" },
        ["<leader>r"] = { name = "+refactor" },
        ["<leader>rs"] = { name = "+swap" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>t"] = { name = "+test" },
        ["<leader>to"] = { name = "+output" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>p"] = { name = "+project" },
        ["<leader>w"] = { name = "+windows" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      }
      if Util.has("noice.nvim") then
        keymaps["<leader>sn"] = { name = "+noice" }
      end
      wk.register(keymaps)
    end,
  },
}

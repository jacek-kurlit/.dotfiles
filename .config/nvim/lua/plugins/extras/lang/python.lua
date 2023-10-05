---@diagnostic disable: missing-parameter
return {

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "black" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { python = { "black" } },
    },
  },
}

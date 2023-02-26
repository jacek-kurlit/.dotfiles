return {

  -- extend auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "saecki/crates.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "jose-elias-alvarez/null-ls.nvim" },
        event = { "BufRead Cargo.toml" },
        opts = {
          null_ls = {
            enabled = true,
            name = "Crates",
          },
        },
      },
    },
  },

  -- add rust to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
    end,
  },

  -- correctly setup mason lsp / dap extensions
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "codelldb", "rust-analyzer", "taplo" })
    end,
  },

  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = { "simrat39/rust-tools.nvim" },
    opts = {
      -- make sure mason installs the server
      setup = {
        rust_analyzer = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            -- stylua: ignore
            if client.name == "rust_analyzer" then
              vim.keymap.set("n", "K", "<CMD>RustHoverActions<CR>", { buffer = buffer })
              vim.keymap.set("n", "<leader>ct", "<CMD>RustDebuggables<CR>", { buffer = buffer, desc = "Run Test" })
              vim.keymap.set("n", "<leader>cr", ":!cargo run<cr>", {buffer= buffer, desc="Cargo run"} )
              vim.keymap.set("n", "<leader>dr", "<CMD>RustDebuggables<CR>", { buffer = buffer, desc = "Run" })
              vim.keymap.set("n", "<A-d>r", "<CMD>RustDebuggables<CR>", { buffer = buffer, desc = "Run Debug" })
            end
          end)
          local mason_registry = require("mason-registry")
          -- rust tools configuration for debugging support
          local codelldb = mason_registry.get_package("codelldb")
          local extension_path = codelldb:get_install_path() .. "/extension/"
          local codelldb_path = extension_path .. "adapter/codelldb"
          local liblldb_path = vim.fn.has("mac") == 1 and extension_path .. "lldb/lib/liblldb.dylib"
            or extension_path .. "lldb/lib/liblldb.so"
          local rust_tools_opts = vim.tbl_deep_extend("force", opts, {
            dap = {
              adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
            },
            tools = {
              hover_actions = {
                auto_focus = true,
              },
              inlay_hints = {
                auto = true,
                show_parameter_hints = true,
              },
              on_initialized = function()
                vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
                  pattern = { "*.rs" },
                  callback = function()
                    local _, _ = pcall(vim.lsp.codelens.refresh)
                  end,
                })
              end,
            },
            server = {
              settings = {
                ["rust-analyzer"] = {
                  lens = {
                    enable = true,
                  },
                  inlayHints = {
                    locationLinks = false,
                  },
                  assist = {
                    importEnforceGranularity = true,
                    importPrefix = "crate",
                  },
                  cargo = {
                    features = "all",
                  },
                  -- Add clippy lints for Rust.
                  checkOnSave = true,
                  check = {
                    command = "clippy",
                    features = "all",
                  },
                  procMacro = {
                    enable = true,
                  },
                },
                inlayHints = {
                  lifetimeElisionHints = {
                    enable = true,
                    useParameterNames = true,
                  },
                },
              },
            },
          })
          require("rust-tools").setup(rust_tools_opts)
          return true
        end,
        taplo = function(_, _)
          local function show_documentation()
            if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
              require("crates").show_popup()
            else
              vim.lsp.buf.hover()
            end
          end

          require("lazyvim.util").on_attach(function(client, buffer)
            -- stylua: ignore
            if client.name == "taplo" then
              vim.keymap.set("n", "K", show_documentation, { buffer = buffer })
            end
          end)
          return false -- make sure the base implementation calls taplo.setup
        end,
      },
    },
  },
}

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

  -- FIXME: going into rust builtin library functions causes lsp to exit with code 101
  -- after starting lsp again with LspStart and using go definition again does not break lsp
  {
    "simrat39/rust-tools.nvim",
    cmd = "LspStart",
    config = function()
      local mason_registry = require("mason-registry")
      -- rust tools configuration for debugging support
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = vim.fn.has("mac") == 1 and extension_path .. "lldb/lib/liblldb.dylib"
        or extension_path .. "lldb/lib/liblldb.so"
      local rust_tools_opts = {
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
          on_attach = function(_, buffer)
            vim.keymap.set("n", "K", "<CMD>RustHoverActions<CR>", { buffer = buffer })
            vim.keymap.set("n", "<leader>ct", "<CMD>RustDebuggables<CR>", { buffer = buffer, desc = "Run Test" })
            vim.keymap.set("n", "<leader>ca", "<CMD>RustCodeAction<CR>", { buffer = buffer, desc = "Code action" })
            vim.keymap.set(
              "n",
              "<leader>ch",
              "<CMD>lua require('rust-tools').hover_actions.hover_actions()<cr>",
              { buffer = buffer, desc = "Hover Actions" }
            )
            vim.keymap.set("n", "<leader>dr", "<CMD>RustDebuggables<CR>", { buffer = buffer, desc = "Run" })

            vim.keymap.set(
              "n",
              "<leader>pr",
              "<cmd>TermExec cmd='cargo run'<cr>",
              { buffer = buffer, desc = "Project run" }
            )
            vim.keymap.set(
              "n",
              "<leader>pb",
              "<cmd>TermExec cmd='cargo build'<cr>",
              { buffer = buffer, desc = "Project build" }
            )
            vim.keymap.set(
              "n",
              "<leader>pc",
              "<cmd>TermExec cmd='cargo clean'<cr>",
              { buffer = buffer, desc = "Project clean" }
            )
            vim.keymap.set(
              "n",
              "<leader>pt",
              "<cmd>TermExec cmd='cargo test'<cr>",
              { buffer = buffer, desc = "Project test all" }
            )
          end,
          settings = {
            ["rust-analyzer"] = {
              lens = {
                enable = true,
              },
              inlayhints = {
                locationlinks = false,
              },
              assist = {
                importenforcegranularity = true,
                importprefix = "crate",
              },
              cargo = {
                features = "all",
              },
              -- add clippy lints for rust.
              checkonsave = true,
              check = {
                command = "clippy",
                features = "all",
              },
              procmacro = {
                enable = true,
              },
            },
            inlayhints = {
              lifetimeelisionhints = {
                enable = true,
                useparameternames = true,
              },
            },
          },
        },
      }
      require("rust-tools").setup(rust_tools_opts)
      return true
    end,
  },
  -- correctly setup lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      setup = {
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

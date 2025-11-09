return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      PATH = "append",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "html",
        "cssls",
        "emmet_ls",
        "lua_ls",
        "ts_ls",
        "pyright",
        "gopls",
        "ansiblels"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            { path = "snacks.nvim",        words = { "Snacks" } },
          },
        },
      },
      { "saghen/blink.cmp" }
    },
    config = function()
      -- TODO: add inlay hints and codelens

      local icons = require('config.icons')
      local diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●"
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostic.Error,
            [vim.diagnostic.severity.WARN] = icons.diagnostic.Warn,
            [vim.diagnostic.severity.HINT] = icons.diagnostic.Hint,
            [vim.diagnostic.severity.INFO] = icons.diagnostic.Info,
          },
        },
      }
      vim.diagnostic.config(vim.deepcopy(diagnostics))
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
          vim.keymap.set("n", "gr", vim.lsp.buf.references)
          vim.keymap.set("n", "gK", vim.lsp.buf.signature_help)
          vim.keymap.set("i", "<c-k>", vim.lsp.buf.signature_help)
        end,
      })
    end,
  },
}

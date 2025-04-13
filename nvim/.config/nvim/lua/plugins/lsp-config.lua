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
          },
        },
      },
      { "saghen/blink.cmp" }
    },
    config = function()
      -- TODO: add inlay hints and codelens

      -- adding completion capabilites to every lsp
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local nvim_lsp = require("lspconfig")
      local language_servers = { 'pyright', 'ansiblels', 'lua_ls', 'ts_ls', 'gopls' }
      for _, ls in ipairs(language_servers) do
        nvim_lsp[ls].setup({
          capabilities = capabilities,
        })
      end
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
          vim.keymap.set("n", "grn", vim.lsp.buf.rename)
          vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
          vim.keymap.set("n", "grr", vim.lsp.buf.references)
          vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help)
        end,
      })
    end,
  },
}

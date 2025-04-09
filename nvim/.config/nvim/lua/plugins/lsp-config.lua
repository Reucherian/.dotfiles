return {
  {
    "williamboman/mason.nvim",
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
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local nvim_lsp = require("lspconfig")
      nvim_lsp.lua_ls.setup({
        capabilities = capabilities,
      })
      nvim_lsp.ts_ls.setup({
        capabilities = capabilities,
      })
      nvim_lsp.gopls.setup({
        capabilities = capabilities,
      })
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

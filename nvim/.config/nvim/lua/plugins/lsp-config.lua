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
      -- adding completion capabilites to every lsp
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local nvim_lsp = require("lspconfig")
      local language_servers = { 'lua_ls', 'ts_ls', 'gopls' }
      for _, ls in ipairs(language_servers) do
        nvim_lsp[ls].setup({
          capabilities = capabilities,
        })
      end
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

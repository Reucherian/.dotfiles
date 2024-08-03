return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
      }
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "tsserver"}
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require("lspconfig")
      nvim_lsp.lua_ls.setup({})
      nvim_lsp.tsserver.setup({})
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function()
          vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
          vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
          vim.keymap.set('n', 'grr', vim.lsp.buf.references)
          vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)
        end,
      })
    end
  }
}

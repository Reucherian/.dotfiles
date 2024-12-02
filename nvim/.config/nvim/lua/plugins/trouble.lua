return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  opts = {
    modes = {
      lsp = {
        win = { position = "right" },
      },
    },
  },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "diagnostics with trouble" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "buffer diagnostics with trouble" },
    { "<leader>cs", "<cmd>Trouble symbols toggle<cr>",                  desc = "toggle symbols for trouble" },
    { "<leader>cS", "<cmd>Trouble lsp toggle<cr>",                      desc = "lsp references and documentation from trouble" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                  desc = "location list from trouble" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                   desc = "quickfix list from trouble" }
  }
}

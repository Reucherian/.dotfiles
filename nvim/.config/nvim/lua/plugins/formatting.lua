return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatter_by_ft = {
      python = { "isort", "black" },
      lua = { "stylua" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    }
  },
  keys = {
    {
      "<leader>gf",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500
        })
      end,
      mode = { "n", "v" },
      desc = "language format file or range"
    }
  },
}

return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatter_by_ft = {
        python = { "isort", "black" },
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      }
    })
    vim.keymap.set({ "n", "v" }, "<leader>gf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500
      })
    end, { desc = "Format file or range" })
  end
}

return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {},
  keys = {
    { "]t",         function() require("todo-comments").jump_next() end,              desc = "next todo comment" },
    { "[t",         function() require("todo-comments").jump_prev() end,              desc = "previous todo comment" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>",                                   desc = "todo (trouble)" },
    { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "todo/fix/fixme (trouble)" },
    { "<leader>st", "<cmd>TodoTelescope<cr>",                                         desc = "todo" },
    { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",                 desc = "todo/fix/fixme" },
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neotree = require("neo-tree")
    neotree.setup({
      popup_border_style = "rounded",
      async_directory_scan = "auto"
    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>")
  end,
}

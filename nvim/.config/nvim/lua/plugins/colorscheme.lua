return {
  "catppuccin/nvim",
  lazy = false, -- this is the main colorsheme so it will be loaded first
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      neotree = false,
    }
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}

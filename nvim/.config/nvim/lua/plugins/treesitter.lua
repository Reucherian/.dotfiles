return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = function()
    return require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

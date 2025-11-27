return {
  { "ThePrimeagen/vim-be-good" },
  { "ellisonleao/glow.nvim",   config = true, cmd = "Glow" },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "snacks.nvim",        words = { "Snacks" } },
      },
    },
  },
}

return {
  "3rd/diagram.nvim",
  dependencies = {
    { "3rd/image.nvim", build = false, opts = { processor = "magick_cli" } }, -- you'd probably want to configure image.nvim manually instead of doing this
  },
  opts = {                                                                    -- you can just pass {}, defaults below
    events = {
      render_buffer = {},
      clear_buffer = { "BufLeave" },
    },
    renderer_options = {
      mermaid = {
        background = "transparent",
        theme = "dark",
        scale = 1,
      }
    },
  },
  keys = {
    {
      "<leader>d",
      function()
        require("diagram").show_diagram_hover()
      end,
      mode = "n",
      ft = { "markdown", "norg" },
      desc = "Show diagram in new tab",
    }
  }
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
  },
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  keys = {
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ dir = vim.uv.cwd(), position = "right" })
      end,
      desc = "Open neo-tree file explorer"
    },
    { "<leader>e", "<leader>fe", desc = "Open neo-tree file explorer", remap = true },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status", position = "right" })
      end,
      desc = "Open the neo-tree git explorer",
    },
    {
      "<leader>be",
      function()
        require("neo-tree.command").execute({ source = "buffers", position = "right" })
      end,
      desc = "Open the neo-tree buffer explorer",
    },
  }
}

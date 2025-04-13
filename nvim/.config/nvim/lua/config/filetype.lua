vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "site.yml", "*/playbooks/*.yml", "*/roles/**/tasks/*.yml", "*/roles/**/handlers/*.yml" },
  callback = function()
    vim.bo.filetype = "yaml.ansible"
  end,
})

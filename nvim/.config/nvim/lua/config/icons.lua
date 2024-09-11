-- diagnostic icons configured here
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
local signs_text = {}
local signs_numhl = {}
for type, icon in pairs(signs) do
  table.insert(signs_text, vim.diagnostic.severity[string.upper(type)], icon)
  table.insert(signs_numhl, vim.diagnostic.severity[string.upper(type)], type .. "Msg")
end
vim.diagnostic.config({
  signs = {
    text = signs_text,
    numhl = signs_numhl,
    linehl = signs_numhl
  }
})

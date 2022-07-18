local signs = {
           Text = "",
           Method = "",
           Function = "",
           Constructor = "",
           Field = "ﰠ",
           Variable = "",
           Class = "ﴯ",
           Interface = "",
           Module = "",
           Property = "ﰠ",
           Unit = "塞",
           Value = "",
           Enum = "",
           Keyword = "",
           Snippet = "",
           Color = "",
           File = "",
           Reference = "",
           Folder = "",
           EnumMember = "",
           Constant = "",
           Struct = "פּ",
           Event = "",
           Operator = "",
           TypeParameter = "",
           Error = " ", 
           Warn = " ", 
           Hint = " ", 
           Info = " "
        }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

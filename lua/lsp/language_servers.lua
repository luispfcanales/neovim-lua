local function buf_set_keymap(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end
local function buf_set_option(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

local key_binding_options = { noremap = true, silent = true }
local on_attach = function( client, bufnr )
  buf_set_option("omnifunc","v:lua.vim.lsp.omnifunc")
  buf_set_keymap("n","gd","<Cmd>lua vim.lsp.buf.definition()<CR>",key_binding_options)
end


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) 
require'lspconfig'.html.setup {
  capabilities = capabilities,
}
require'lspconfig'.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require'lspconfig'.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require'lspconfig'.svelte.setup {
  capabilities = capabilities,
}
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

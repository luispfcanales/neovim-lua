local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'

local on_attach = function( client, bufnr )
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end
  buf_set_option("omnifunc","v:lua.vim.lsp.omnifunc")
  local key_binding_options = { noremap = true, silent = true }
  buf_set_keymap("n","gd","<Cmd>lua vim.lsp.buf.definition()<CR>",key_binding_options)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) 
nvim_lsp.html.setup {
  capabilities = capabilities,
}
nvim_lsp.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.svelte.setup {
  capabilities = capabilities,
}
nvim_lsp.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

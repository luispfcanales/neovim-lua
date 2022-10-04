local status_ok, nvim_lsp = pcall(require , 'lspconfig')
if not status_ok then
  return
end

local navic = require("nvim-navic")

local on_attach = function( client, bufnr )
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  navic.attach(client,bufnr)

  buf_set_option("omnifunc","v:lua.vim.lsp.omnifunc")
  local key_binding_options = { noremap = true, silent = true }
  --go to definition
  buf_set_keymap("n","<leader>gd","<Cmd>lua vim.lsp.buf.definition()<CR>",key_binding_options)
  --buf_set_keymap("n","K","<Cmd>lua vim.lsp.buf.hover()<CR>",key_binding_options)
  buf_set_keymap("n","gd","<Cmd>Lspsaga preview_definition<CR>",key_binding_options)
  buf_set_keymap("n","K","<Cmd>Lspsaga hover_doc<CR>",key_binding_options)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) 
nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
nvim_lsp.gopls.setup {
  on_attach = on_attach,
}
require "lsp_signature".setup({
  bind = true,
})
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
nvim_lsp.html.setup {
  capabilities = capabilities,
}

local saga = require 'lspsaga'
saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}
--close_preview_autocmd({})
vim.cmd([[
nnoremap <silent> go <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
]])

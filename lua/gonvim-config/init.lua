require('go').setup()
--auto save format
--vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()]],false )
vim.api.nvim_exec([[ autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 ]],false)

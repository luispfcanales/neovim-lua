require('go').setup()
--auto save format
--vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()]],false )

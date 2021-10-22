local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, expr = false })
end

-- Define Mapleader
vim.g.mapleader = ','

-- Files open configs
mapper('n', '<leader>fv', ':tabnew<CR>:e ~/AppData/Local/nvim/lua/plugins/init.lua<CR>')
mapper('n', '<leader>fs', ':tabnew<CR>:e ~/AppData/Local/nvim/lua/settings.lua<CR>')
mapper('n', '<leader>fk', ':tabnew<CR>:e ~/AppData/Local/nvim/lua/keymaps.lua<CR>')
mapper('n', '<leader>fi', ':tabnew<CR>:e ~/AppData/Local/nvim/init.lua<CR>')

mapper('n', '<leader>d', ':NvimTreeToggle<CR>')
mapper('i', '<A-i>', '<ESC>')
mapper('v', '<A-i>', '<ESC>')

-- Exit and save
mapper('n', '<leader>w', ':w<CR>')
mapper('n', '<leader>ef', ':q!<CR>')

-- use ESC to turn off search highlighting
mapper('n', '<Esc>', ':noh<CR>')

-- moved in tabs
mapper('n','<TAB>',':tabnext<CR>')
-- open terminal new tab
mapper('v', '<leader>x', ':tabnew<CR>:ter<CR>i')
mapper('n', '<leader>x', ':tabnew<CR>:ter<CR>i')
-- Get out of the Terminal
mapper('t', '<A-i>', '<C-\\><C-n>')
mapper('t', '<leader>ef', '<C-\\><C-n>:q!<CR><CR>')


-- moved splits
mapper('n','<A-j>','<C-w>j')
mapper('n','<A-k>','<C-w>k')
mapper('n','<A-l>','<C-w>l')
mapper('n','<A-h>','<C-w>h')

--faster scrolling
mapper('n','<C-j>','10<C-e>')
mapper('n','<C-k>','10<C-y>')


vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_format_strings = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_structs = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_function_arguments = 1
vim.g.go_highlight_variable_assignments = 1

-- Pass to lua
vim.cmd([[
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
silent! colorscheme  tokyonight
]])

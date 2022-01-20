local on_windows = vim.loop.os_uname().version:match 'Windows'

local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, expr = false })
end

-- Define Mapleader
vim.g.mapleader = ','

local init,settings,keymaps,plugins = 'init.lua','lua/settings.lua','lua/keymaps.lua','lua/plugins/init.lua'
local routeConfigNvim = ':e ~/.config/nvim/'
if on_windows then
  routeConfigNvim = ':e ~/AppData/Local/nvim/'
end
mapper('n', '<leader>fv', routeConfigNvim .. plugins .. '<CR>')
mapper('n', '<leader>fs', routeConfigNvim .. settings .. '<CR>')
mapper('n', '<leader>fk', routeConfigNvim .. keymaps .. '<CR>')
mapper('n', '<leader>fi', routeConfigNvim .. init .. '<CR>')

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
--copy 
mapper('n','<leader>c','vi(y')

--golang format
mapper('n','<leader>f',':GoImport<CR>')
mapper('n','<leader>s',':GoFillStruct<CR>')
mapper('n','<leader>ad',':GoAddTag<CR>')
mapper('n','<leader>x',':GoRmTag<CR>')

--split vertical
mapper('n','<leader><space>',':vs<CR><C-w>l<CR>')

--indent lines
mapper('v','<','<gv')
mapper('v','>','>gv')
mapper('n','<A-j>',':m .+1<CR>==')
mapper('n','<A-k>',':m .-2<CR>==')
--call to telescope find files
mapper("n", "<leader>m", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>")

-- Pass to lua
vim.cmd([[ silent! colorscheme  tokyonight ]])

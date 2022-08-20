local on_windows = vim.loop.os_uname().version:match 'Windows'

local mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, expr = false })
end

-- Define Mapleader
vim.g.mapleader = ','

local init,settings,keymaps,plugins = 'init.lua','lua/settings.lua','lua/keymaps.lua','lua/load-plugins/init.lua'
local routeConfigNvim = ':e ~/.config/nvim/'

local routeSnipConfig = '~/.config/nvim/snippets'
if on_windows then
  routeConfigNvim = ':e ~/AppData/Local/nvim/'
  routeSnipConfig = '~/AppData/Local/nvim/snippets'
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

-- moved in tabs buffers
mapper('n','<TAB>',':bn<CR>')
mapper('n','<S-TAB>',':bp<CR>')
mapper('n','<A-x>',':bd!<CR>')
mapper('t', '<A-i>', '<C-\\><C-n>')
mapper('t', '<leader>x', '<C-\\><C-n>:bd!<CR><CR>')

-- moved splits
--mapper('n','<A-j>','<C-w>j')
--mapper('n','<A-k>','<C-w>k')
mapper('n','<A-l>','<C-w>l')
mapper('n','<A-h>','<C-w>h')

--faster scrolling
mapper('n','<C-j>','10<C-e>')
mapper('n','<C-k>','10<C-y>')
--copy 
mapper('n','<leader>c','vi(y')

--golang format
--mapper('n','<leader>s',':GoFillStruct<CR>')
mapper('n','<leader>ad',':GoAddTags<CR>')
mapper('n','<leader>x',':GoClearTags<CR>')
mapper('n','<leader>ei',':GoIfErr<CR>')

--split vertical 
local triggerFindfile = "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>"
local splitRight = ":vs<CR><C-w>l<CR>"
mapper('n','<A-n>',splitRight .. triggerFindfile )
mapper("n", "<leader>m", triggerFindfile)

--indent lines
mapper('v','<','<gv')
mapper('v','>','>gv')
mapper('n','>','>>')
mapper('n','<','<<')
mapper('n','<A-j>',':m .+1<CR>==')
mapper('n','<A-k>',':m .-2<CR>==')

--keymapping to lightspeed plugin
mapper('n','s','<Plug>Lightspeed_s')
mapper('n','S','<Plug>Lightspeed_S')

mapper('n','<A-s>','<cmd>Lspsaga rename<cr>')
--gitsigns keys
mapper('n','<leader><space>','<cmd>Gitsigns preview_hunk<cr>')
mapper('n','\\df','<cmd>Gitsigns diffthis<cr>')

--personal commands to execute
mapper("n", "<leader>z", "<cmd>lua require'commands'.GoRun()<CR>")

vim.cmd('filetype plugin indent on')
local g,o,bo,wo,cmd,fn = vim.g,vim.o,vim.bo,vim.wo,vim.cmd,vim.fn

-- Syntax on!
g.syntax_on = true
o.synmaxcol = 1500

o.shortmess = o.shortmess .. 'c'
vim.opt.termguicolors = true
o.pumheight = 10
o.showtabline = 2
--o.showmode = false
o.clipboard = "unnamedplus"
o.scrolloff = 10
o.sidescrolloff = 5

-- Numbers
wo.number = true
o.number = true

-- Relative Numbers!
wo.relativenumber = true
o.relativenumber = true

-- Nice Time
o.updatetime = 250

-- When line is longer than the screen, it continues on the next line
wo.wrap = false
o.wrap = false
-- But don't break words, only 'by words'
wo.linebreak = true

-- Tabs to Spaces
o.expandtab = true
bo.expandtab = true
o.tabstop = 2
-- Correct level of indentation
o.shiftwidth = 2
bo.shiftwidth = 2

-- I have a special configuration for each file in ftplugin/
o.softtabstop = 2
bo.softtabstop = 2

-- Autoident
o.autoindent = true
bo.autoindent = true

-- Highlight all matches while searching
o.incsearch = true
o.hlsearch = true

-- Swapfiles are nice
o.swapfile = false
-- Backups are nice
o.backup = false

o.lazyredraw = true
vim.opt.mouse = 'a'
-- Set zsh as shell (which zsh)
--o.shell = "/usr/bin/bash"
--cmd([[ set tabline=%t\ %M ]])
cmd([[ set laststatus=3 ]])

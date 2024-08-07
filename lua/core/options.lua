vim.cmd('filetype plugin indent on')
-- Syntax on!
--o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.g.syntax_on = true
vim.opt.synmaxcol = 1500

--vim.opt.shortmess = vim.opt.shortmess .. 'c'
vim.opt.termguicolors = true
vim.opt.pumheight = 10
vim.opt.showtabline = 2
--o.showmode = false
vim.opt.clipboard:append("unnamedplus")

vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 8

-- Numbers
vim.opt.number = true

-- Relative Numbers!
vim.opt.relativenumber = true

-- Nice Time
--o.updatetime = 250 --testing now

-- When line is longer than the screen, it continues on the next line
vim.opt.wrap = false --disable line wrapping
--
-- But don't break words, only 'by words'
vim.opt.linebreak = true

-- Tabs to Spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- I have a special configuration for each file in ftplugin/
vim.opt.softtabstop = 2
vim.opt.softtabstop = 2

-- Autoident
vim.opt.autoindent = true

-- Highlight all matches while searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Swapfiles are nice
vim.opt.swapfile = false
-- Backups are nice
vim.opt.backup = false

vim.opt.lazyredraw = true
vim.opt.mouse = 'a'

-- open with neovide
if vim.g.neovide then
  --vim.o.guifont = "Source Code Pro:h10"
  vim.o.guifont = "Mononoki Nerd Font:h12"
end

-- Set zsh as shell (which zsh)
--o.shell = "/usr/bin/bash"
--cmd([[ set tabline=%t\ %M ]])
--cmd([[ 
--set laststatus=3 
--colorscheme gruvbox
--]])

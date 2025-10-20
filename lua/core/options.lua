vim.cmd('filetype plugin indent on')
-- Syntax on!
--o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- disable margen left icons
--vim.wo.signcolumn = "no"

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
  vim.o.guifont = "Cascadia Code:h13"
  vim.g.neovide_opacity = 0.90
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_hide_mouse_when_typing = true
end

local on_windows = vim.loop.os_uname().version:match 'Windows'
if on_windows then
  vim.opt.shellslash = true
end

-- Set zsh as shell (which zsh)
--o.shell = "/usr/bin/bash"
--cmd([[ set tabline=%t\ %M ]])
--cmd([[ 
--set laststatus=3 
--colorscheme gruvbox
--]])

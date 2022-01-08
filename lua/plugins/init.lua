-- Load pluginManager
vim.cmd([[
call plug#begin(stdpath('data').'/plugged')

    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'norcalli/nvim-colorizer.lua'

    Plug 'hoob3rt/lualine.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'windwp/nvim-ts-autotag'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'windwp/nvim-autopairs'

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    " For vsnip user.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    Plug 'ray-x/go.nvim'
    Plug 'akinsho/toggleterm.nvim'

    "shade split
    Plug 'sunjon/shade.nvim'
    
    "telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    "lspsaga
    "Plug 'glepnir/lspsaga.nvim'

call plug#end()
]])

require('plugins.icons')
require('plugins.nvimtree')
require('plugins.lualine')
require('plugins.tokyonight')
require('plugins.autopairs')
require('plugins.colorizer-config')

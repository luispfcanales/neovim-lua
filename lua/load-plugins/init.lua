local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v1.*'
  }
  use 'norcalli/nvim-colorizer.lua'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-autopairs'

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    event = "BufWinEnter",
    config = "require('bufferline-config')"
  }

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  use { 'kkharji/lspsaga.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v1.*'
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'ggandor/lightspeed.nvim'

  use 'crispgm/nvim-go'
  use 'ray-x/lsp_signature.nvim'
end)

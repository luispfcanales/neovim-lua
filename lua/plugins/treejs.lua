return {
  'Wansmer/treesj',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesj').setup()
    vim.keymap.set('n', '<leader>m', require('treesj').toggle)
  end,
}

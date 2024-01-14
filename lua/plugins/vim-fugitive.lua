return {
  "tpope/vim-fugitive",
  config=function()
    vim.keymap.set('n', '<leader>z',"<cmd>Git<CR>")
  end,
}

return {
  "echasnovski/mini.nvim",
  --version = false,  -- Para la versión main (desarrollo)
  version = "*",  -- Para la versión stable
  config = function()
    -- Configuración básica de mini.files
    require('mini.files').setup()
    
    -- Mapeo personalizado para abrir mini.files
    vim.keymap.set('n', '<C-m>', '<Cmd>lua MiniFiles.open()<CR>', { desc = 'Open File Explorer' })
    vim.keymap.set('n', '<C-b>', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>', { desc = 'Open File Explorer (current file)' })
  end,
}

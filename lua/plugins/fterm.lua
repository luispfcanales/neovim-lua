return {
  "numToStr/FTerm.nvim",
  config = function()
    require('FTerm').setup({
      border = 'rounded',
      dimensions  = {
        height = 0.9,
        width = 0.9,
      },
      cmd = 'powershell.exe',
    })

    -- Opcional: mapear teclas para abrir y cerrar FTerm
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    keymap('n', '<leader>t', '<CMD>lua require("FTerm").toggle()<CR>', opts)
    keymap('t', '<leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
  end,
}

-- Configuración de indentación que funciona en ambos sistemas
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"scss","js","cs"},
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"go"},
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = false
  end,
})

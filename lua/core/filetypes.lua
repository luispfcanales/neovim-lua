-- Autocomando para sobrescribir a 4 espacios solo en estos tipos de archivo.
vim.api.nvim_create_autocmd("FileType",{
  pattern = {"scss","js","go","cs"},
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.tabstop = 4
    
    vim.bo.expandtab = false 
  end,
})

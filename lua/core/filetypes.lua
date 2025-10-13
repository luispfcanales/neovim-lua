vim.api.nvim_create_autocmd("FileType",{
  pattern = {"scss","js","go"},
  callback = function()
    vim.schedule(function()
      vim.o.shiftwidth = 4
      vim.bo.shiftwidth = 4
      vim.o.softtabstop = 4
      vim.bo.softtabstop = 4
      vim.o.tabstop = 4
    end)
  end,
})

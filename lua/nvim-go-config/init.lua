local status_ok, golang = pcall(require,"go")
if not status_ok then
  return
end
golang.setup({})
vim.api.nvim_exec([[ autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 ]],false)

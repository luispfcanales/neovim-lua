local status, rose = pcall(require,'rose-pine')
if not status then
  return
end
rose.setup({
  dark_variant = 'moon',
})
vim.cmd('colorscheme rose-pine')

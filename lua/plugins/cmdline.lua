return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    require('fine-cmdline').setup({
      popup = {
        position = {
          row = '50%',
          col = '50%',
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = 'rounded',
        },
        win_options = {
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
        },
      },
    })
    vim.keymap.set(
      'n',
      '<A-z>',
      "<cmd>lua require('fine-cmdline').open({default_value = 'GoImpl '})<CR>",
      {noremap = true}
    )
  end,
}

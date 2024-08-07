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
    vim.keymap.set(
      'n',
      '<A-w>',
      [[<cmd>lua require('fine-cmdline').open({default_value = 'lcd C:\\Users\\gopher\\Desktop\\unamad'})<CR>]],
      {noremap = true}
    )
    vim.keymap.set(
      'n',
      '<A-p>',
      [[<cmd>lua require('fine-cmdline').open({default_value = 'lcd C:\\Users\\gopher\\Documents\\GitHub\\UNAMAD_AKDEMIC'})<CR>]],
      {noremap = true}
    )
  end,
}

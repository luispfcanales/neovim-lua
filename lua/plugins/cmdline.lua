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

    -- echo $env:USERPROFILE
    local user_path = os.getenv("USERPROFILE") -- Obtiene el path del usuario
    vim.keymap.set(
      'n',
      '<A-z>',
      "<cmd>lua require('fine-cmdline').open({default_value = 'GoImpl '})<CR>",
      {noremap = true}
    )
    vim.keymap.set(
      'n',
      '<A-w>',
      '<cmd>lua require("fine-cmdline").open({default_value = "lcd ' .. user_path:gsub("\\", "/") .. '/Desktop/unamad"})<CR>',
      { noremap = true }
    )
    vim.keymap.set(
      'n',
      '<A-p>',
      '<cmd>lua require("fine-cmdline").open({default_value = "lcd ' .. user_path:gsub("\\", "/") .. '/Documents/GitHub/UNAMAD_AKDEMIC"})<CR>',
      { noremap = true }
    )
  end,
}

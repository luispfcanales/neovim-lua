return {
  "numToStr/FTerm.nvim",
  config = function()
    local FTerm = require('FTerm')

    local terminals = {
      FTerm:new({
        border = 'rounded',
        dimensions = { height = 0.9, width = 0.9 },
        cmd = 'powershell.exe',
      }),
      FTerm:new({
        border = 'rounded',
        dimensions = { height = 0.9, width = 0.9 },
        cmd = 'powershell.exe',
      }),
    }

    local function switch_term(index)
      return function()
        for i, term in ipairs(terminals) do
          if i ~= index then
            term:close()
          end
        end
        terminals[index]:toggle()
        -- Mostrar notificación del terminal activo
        vim.notify("Terminal " .. index, vim.log.levels.INFO, { timeout = 1000 })
      end
    end

    vim.keymap.set('n', '<A-1>', switch_term(1), { noremap = true, silent = true })
    vim.keymap.set('t', '<A-1>', switch_term(1), { noremap = true, silent = true })

    vim.keymap.set('n', '<A-2>', switch_term(2), { noremap = true, silent = true })
    vim.keymap.set('t', '<A-2>', switch_term(2), { noremap = true, silent = true })
  end,
}

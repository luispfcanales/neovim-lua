-- Obtener información del sistema operativo
local on_windows = vim.loop.os_uname().version:match 'Windows'

-- pero es buena práctica declararlo explícitamente para claridad.
local default_opts = { noremap = true, silent = true }

-- Define Mapleader
vim.g.mapleader = ','

-- Rutas de configuración
local init, options, keymaps = 'init.lua', 'lua/core/options.lua', 'lua/core/keymaps.lua'
local routeConfigNvim = ':e ~/.config/nvim/'
-- Si routeSnipConfig no se usa en un keymap aquí, se puede omitir o dejar sin usar

if on_windows then
  routeConfigNvim = ':e ~/AppData/Local/nvim/'
end

-- Función auxiliar para simplificar la sintaxis de vim.keymap.set (Opcional, pero útil)
local map = vim.keymap.set

---
--- 1. Asignaciones para abrir la configuración
---
map('n', '<leader>fo', routeConfigNvim .. options .. '<CR>', default_opts)
map('n', '<leader>fk', routeConfigNvim .. keymaps .. '<CR>', default_opts)
map('n', '<leader>fi', routeConfigNvim .. init .. '<CR>', default_opts)

---
--- 2. Navegación, Comandos Básicos y Movimiento
---

-- Moverse entre buffers (pestañas)
map('n', '<TAB>', ':bn<CR>', default_opts)
map('n', '<S-TAB>', ':bp<CR>', default_opts)
map('n', '<A-x>', ':bd!<CR>', default_opts)

-- Salir y guardar
map('n', '<leader>w', ':w<CR>', default_opts)
map('n', '<leader>ef', ':q!<CR>', default_opts)

-- Desactivar el resaltado de búsqueda (search highlighting)
map('n', '<Esc>', ':noh<CR>', default_opts)

-- Movimiento de splits (ventanas)
map('n', '<A-l>', '<C-w>l', default_opts)
map('n', '<A-h>', '<C-w>h', default_opts)

-- Movimiento rápido de líneas (necesitan la bandera {expr = false} para <CR>)
map('n', '<A-j>', ':m .+1<CR>==', default_opts)
map('n', '<A-k>', ':m .-2<CR>==', default_opts)

-- scrolling más rápido
map('n', '<C-j>', '10<C-e>', default_opts)
map('n', '<C-k>', '10<C-y>', default_opts)

-- G seguido de G, pero en el centro de la pantalla
map('n', 'G', 'Gzz', default_opts)

-- Ventana de archivos/buffers: abrir todos los buffers en splits verticales
-- La función para alternar entre splits verticales de todos los buffers
local function toggle_sball()
  local win_count = #vim.api.nvim_list_wins()
    if win_count > 1 then
      vim.cmd('only')
    else
      vim.cmd('vertical sball')
    end
end

-- Asignación de tecla actualizada
vim.keymap.set('n', '<C-a>', toggle_sball, default_opts)

---
--- 3. Modos y Edición
---

-- Salir de modos visual/insertar con Alt-i
map({ 'i', 'v' }, '<A-i>', '<ESC>', default_opts)
-- Salir de la terminal (terminal mode) con Alt-i
map('t', '<A-i>', '<C-\\><C-n>', default_opts)

-- Indentación en modo visual
map('v', '<', '<gv', default_opts)
map('v', '>', '>gv', default_opts)
-- Indentación en modo normal
map('n', '>', '>>', default_opts)
map('n', '<', '<<', default_opts)

-- Copiar el contenido interno de ()
map('n', '<leader>c', 'vi(y', default_opts)

-- Borrar el contenido interno de ""
map('n', '<leader>ds', 'di"i', default_opts)

-- Borrar palabra con cursor en el final (similar a 'db'
map('n', 'dw', 'vb_d', default_opts)

-- Recargar configuración
map('n', '<leader>r', ':so %<CR>', default_opts)

---
--- 4. Asignaciones con Funciones de Lua (Plugins/API)
---

-- Copiar todo el contenido del buffer (El que causó el problema original)
map('n', '<leader>ac', function()
  vim.api.nvim_command('normal! ggVGy')
  vim.notify('✅ Todo el contenido copiado al portapapeles', vim.log.levels.INFO, { title = 'Keymap' })
end, default_opts)

-- LspSaga Rename
map('n', '<A-s>', '<cmd>Lspsaga rename<cr>', default_opts)

-- Gitsigns: previsualizar hunk
map('n', '<leader><space>', '<cmd>Gitsigns preview_hunk<cr>', default_opts)

-- Gitsigns: diff con Gvdiff
map('n', '<C-\\>', '<cmd>Gvdiff<cr>', default_opts)

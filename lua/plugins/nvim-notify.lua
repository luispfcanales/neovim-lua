return {
  "rcarriga/nvim-notify",
  lazy = false,  -- Cargar al inicio
  priority = 1000,  -- Cargar antes que otros plugins
  config = function()
    local notify = require("notify")
    
    notify.setup({
      timeout = 3000,
      max_width = 50,
      stages = "fade_in_slide_out",
      background_colour = "#000000",
    })
    
    -- Reemplazar vim.notify
    vim.notify = notify
  end,
}

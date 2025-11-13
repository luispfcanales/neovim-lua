return {
  "folke/tokyonight.nvim",
  priority = 1001, -- Mayor prioridad
  config = function()
    require("tokyonight").setup({
      style = "storm",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      }
    })
    -- vim.cmd('colorscheme tokyonight')
  end,
}

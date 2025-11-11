return {
  --[[ "nvimdev/indentmini.nvim",
  event = "BufEnter",
  config = function()
    require("indentmini").setup({
      --char = "│",
      --
      --char = "╎",
      char = "┊",
      exclude = {
        "dashboard",
        "lazy",
        "help",
        "markdown",
        "neo-tree",
        "Trouble",
        "trouble"
      },
      minlevel = 1,
      only_current = false,
    })

    -- Opcional: personalizar colores de la línea de indentación
    vim.cmd.highlight("IndentLine guifg=#3b4261")
    vim.cmd.highlight("IndentLineCurrent guifg=#61afef")
  end, ]]
}

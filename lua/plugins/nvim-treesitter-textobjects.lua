return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = "nvim-treesitter/nvim-treesitter",
  after = "nvim-treesitter", -- Asegurar que se carga después
  config = function()
    -- Solo extender la configuración, no setup completo
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            --- functions select
            ["if"] = { query = "@function.inner", desc = "Inside function" },
            ["af"] = { query = "@function.outer", desc = "Around function" },

            ["ab"] = { query = "@block.outer", desc = "Around block" },
            ["ib"] = { query = "@block.inner", desc = "Inside block" },

            --- parameters select
            ["ap"] = { query = "@parameter.outer", desc = "Around parameter" },
            ["ip"] = { query = "@parameter.inner", desc = "Inside parameter" },

          },
        },
      },
    })
  end,
}

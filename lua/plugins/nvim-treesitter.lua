return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = {"BufReadPre","BufNewFile"},
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local status_ok, treesitter = pcall(require,"nvim-treesitter.configs")
      if not status_ok then
        return
      end
      
      -- SETUP PRIMERO del contexto de comentarios
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
      
      treesitter.setup({
        ensure_installed = { 
          "go","svelte","javascript","typescript", "tsx","css",
          "json","lua","html","proto","markdown","vim",
          "dart","python",
        },
        
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = {"c_sharp"},
        },
        
        autotag = {
          enable = true,
          filetypes = {
            "html",
            "svelte", 
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact"
          },
        },
        
        rainbow = {
          enable = true,
          extended_mode = false,
          max_file_lines = 1000, -- LÍMITE para archivos grandes
          disable = {"go","html", "c_sharp"}, -- Deshabilitar para C#
        },
        
        -- AUTOINSTALACIÓN DESHABILITADA para mejor rendimiento
        auto_install = false,
        
        indent = {
          enable = true,
          disable = {"c_sharp", "python"}, -- C# tiene indentación problemática
        },
        
        -- NUEVA CONFIGURACIÓN DE RENDIMIENTO
        incremental_selection = {
          enable = false, -- Deshabilitar en proyectos grandes
        },
        
        textobjects = {
          enable = false, -- Deshabilitar en proyectos grandes
        }
      })
      
      -- ELIMINAR esta línea problemática
      -- vim.g.skip_ts_context_commentstring_module = true
    end,
  }
}

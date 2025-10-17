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
      
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
      
      treesitter.setup({
        ensure_installed = { 
          "go","svelte","javascript","typescript", "tsx","css",
          "json","lua","html","proto","markdown","vim",
          "dart","python","c_sharp",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
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
          max_file_lines = nil,
          disable = {"go","html"},
        },
        autopairs = {
          enable = true
        },
        indent = {
          enable = true,
        },
        auto_install = true,
      })
      
      vim.g.skip_ts_context_commentstring_module = true
    end,
  }
}

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      svelte = { "prettier" },
      markdown = { "prettier" },
      
      cs = { "csharpier" },
      php = { "php_cs_fixer" },
    },
    -- Formatear al guardar (excepto Go)
    format_on_save = function(bufnr)
      -- Desactivar para Go, go.nvim lo maneja
      if vim.bo[bufnr].filetype == "go" then
        return
      end
      return {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    end,
  },
  init = function()
    -- Instalar formatters con Mason
    vim.api.nvim_create_autocmd("User", {
      pattern = "MasonToolsUpdateCompleted",
      callback = function()
        vim.schedule(function()
          require("mason-tool-installer").check_install()
        end)
      end,
    })
  end,
}

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {
    -- Instalar automáticamente estos servidores
    ensure_installed = {
      "gopls",
      "ts_ls",
      "svelte",
      "html",
      "cssls",
      "omnisharp",
    },
    -- Habilitar automáticamente servidores instalados con vim.lsp.enable()
    automatic_enable = true,
  },
}

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
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
    },
    -- Esta es la opción correcta para auto-setup
    automatic_installation = true,
  },
}

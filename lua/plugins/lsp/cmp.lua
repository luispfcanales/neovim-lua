return {
  "neovim/nvim-lspconfig",
  event = {"BufReadPre","BufNewFile"},
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp", 
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "williamboman/mason-lspconfig.nvim",
    "ray-x/lsp_signature.nvim"
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    
    -- Configuración de cmp
    vim.opt.completeopt = {"menu","menuone","noselect"}
    
    cmp.setup({
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-Space>'] = cmp.mapping.complete(),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer' },
      },
    })
    
    -- Commands lspconfig
    local keymap = vim.keymap
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
      keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      keymap.set("n", "W", vim.diagnostic.open_float, opts)
      
      require("lsp_signature").on_attach({
        bind = true,
        handler_opts = {
          border = "rounded"
        },
        hint_enable = false,
        floating_window = true,
        toggle_key = '<C-k>',
      }, bufnr)
    end
    
    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = " ",
          [vim.diagnostic.severity.INFO] = " ",
        }
      }
    })
    
    -- Configurar cada servidor usando vim.lsp.config (API nueva de Neovim 0.11)
    vim.lsp.config.gopls = {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_markers = { "go.work", "go.mod", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
    }
    
    vim.lsp.config.ts_ls = {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
    }
    
    vim.lsp.config.svelte = {
      cmd = { "svelteserver", "--stdio" },
      filetypes = { "svelte" },
      root_markers = { "package.json", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
    }
    
    vim.lsp.config.html = {
      cmd = { "vscode-html-language-server", "--stdio" },
      filetypes = { "html" },
      root_markers = { "package.json", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
    }
    
    vim.lsp.config.cssls = {
      cmd = { "vscode-css-language-server", "--stdio" },
      filetypes = { "css", "scss", "less" },
      root_markers = { "package.json", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
    }
    
    vim.lsp.config.omnisharp = {
      cmd = { "omnisharp" },
      filetypes = { "cs", "vb" },
      root_markers = { "*.csproj", "*.sln", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        omnisharp = {
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
    }
    
    -- Habilitar todos los servidores configurados
    vim.lsp.enable({"gopls", "ts_ls", "svelte", "html", "cssls", "omnisharp"})
    
  end,
}

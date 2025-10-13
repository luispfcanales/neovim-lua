-- cmp.lua
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
    "mason-org/mason-lspconfig.nvim",
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
    local on_attach = function(client, buf)
      local opts = { noremap = true, silent = true, buffer = buf }
      keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
      keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      keymap.set("n", "W", vim.diagnostic.open_float, opts)
      
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
    
    local lsp = vim.lsp
    
    -- Configurar cada servidor instalado por Mason
    lsp.config.gopls = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    }
    
    lsp.config.ts_ls = {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    
    lsp.config.svelte = {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    
    lsp.config.html = {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    
    lsp.config.cssls = {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    
    lsp.config.omnisharp = {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "omnisharp" },
      enable_roslyn_analyzers = true,
      organize_imports_on_format = true,
      enable_import_completion = true,
    }
    
  end,
}

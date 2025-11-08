return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- Configuración de cmp
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    cmp.setup({
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-k>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.close()
          end
          vim.lsp.buf.signature_help()
        end, { 'i', 'c' }),
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer' },
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lsp_signature_help = "[Sig]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
    })

    -- Sobrescribir el handler de mensajes del LSP
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    -- Interceptar mensajes de window/showMessage y enviarlos a nvim-notify
    vim.lsp.handlers["window/showMessage"] = function(err, result, ctx, config)
      if result and result.message then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        local client_name = client and client.name or "LSP"

        local level = ({
          [1] = vim.log.levels.ERROR,
          [2] = vim.log.levels.WARN,
          [3] = vim.log.levels.INFO,
          [4] = vim.log.levels.DEBUG,
        })[result.type] or vim.log.levels.INFO

        vim.notify(result.message, level, {
          title = client_name,
          timeout = 2000,
        })
      end
    end

    -- Interceptar mensajes de window/logMessage y enviarlos a nvim-notify
    vim.lsp.handlers["window/logMessage"] = function(err, result, ctx, config)
      if result and result.message then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        local client_name = client and client.name or "LSP"

        local level = ({
          [1] = vim.log.levels.ERROR,
          [2] = vim.log.levels.WARN,
          [3] = vim.log.levels.INFO,
          [4] = vim.log.levels.DEBUG,
        })[result.type] or vim.log.levels.INFO

        vim.notify(result.message, level, {
          title = client_name,
          timeout = 1500,
        })
      end
    end

    -- Commands lspconfig
    local keymap = vim.keymap
    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
      keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      keymap.set("n", "W", vim.diagnostic.open_float, opts)
      keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
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

    -- Go
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

    vim.lsp.config.csharp_ls = {
      filetypes = { "cs", "vb" },
      root_markers = { "*.sln", "*.csproj", "global.json", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        ["csharp-ls"] = {
          enable_roslyn_analysers = true,
          disable_format = false,
        },
      },
    }

    -- Habilitar todos los servidores configurados
    --[[ vim.lsp.enable({
      "gopls",
      "ts_ls",
      "svelte",
      "html",
      "cssls",
      "csharp_ls",
    }) ]]
  end,
}

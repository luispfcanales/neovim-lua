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
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp") -- configuration cmp-nvim-lsp
    local cmp = require("cmp") -- configuration cmp
    local luasnip = require("luasnip")

    vim.opt.completeopt = {"menu","menuone","noselect"}
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

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

    -- commands lspconfig
    local keymap = vim.keymap
    local on_attach = function(client,buf)
      local opts = { noremap = true, silent = true, buffer = buf }
      --keymap.set("n","<leader>gd","<Cmd>Telescope lsp_definitions<CR>",opts)
      keymap.set("n","<leader>gd","<Cmd>lua vim.lsp.buf.definition()<CR>",opts)
      keymap.set("n","<leader>gi","<cmd>Telescope lsp_implementations<CR>", opts)
      --keymap.set("n", "W", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
      keymap.set("n","K",vim.lsp.buf.hover,opts)
      keymap.set("n","W",vim.diagnostic.open_float,opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    --lsp config servers
    lspconfig.gopls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    lspconfig.tsserver.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    lspconfig.svelte.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    lspconfig.html.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    lspconfig.cssls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }
    lspconfig.anakin_language_server.setup{}
    lspconfig.csharp_ls.setup{
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
}

--nvim_lsp.gopls.setup {
--  on_attach = on_attach,
--}
--require "lsp_signature".setup({
--  bind = true,
--})

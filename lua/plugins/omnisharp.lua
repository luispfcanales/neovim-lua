return {
  "OmniSharp/omnisharp-vim",
  ft = { "cs", "razor" },  -- Solo carga el plugin para archivos .cs
  config = function()
    ----ESTO CUANDO SE INSTALA MANUALMENTE
    --vim.g.OmniSharp_server_path = 'C:\\Users\\gopher\\Downloads\\omnisharp-win-x64\\OmniSharp.exe'
    --vim.g.OmniSharp_server_use_mono = 0
    --vim.g.OmniSharp_server_args = '--languageserver --hostPID ' .. tostring(vim.fn.getpid())
    
    -- Puedes añadir configuraciones adicionales aquí si es necesario
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "cs",
      callback = function()
        --vim.api.nvim_set_keymap("n", "<leader>gd", ":OmniSharpGotoDefinition<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>gi", ":OmniSharpFindImplementations<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<A-f>", ":OmniSharpCodeFormat<CR>", { noremap = true, silent = true })
        --vim.api.nvim_set_keymap("n", "<leader>rn", ":OmniSharpRename<CR>", { noremap = true, silent = true })
        --vim.api.nvim_set_keymap("n", "<leader>f", ":OmniSharpFindSymbols<CR>", { noremap = true, silent = true })
        vim.api.nvim_create_autocmd("User",{
          pattern = "OmniSharpReady",
          callback = function()
            vim.cmd("colorscheme gruvbox")
          end,
        })
      end,
    })
  end,
}

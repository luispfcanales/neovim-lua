return {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local themes = require "telescope.themes"

    require('telescope').setup {
      --defaults = vim.tbl_extend(
      --  "force",
      --  themes.get_dropdown(),
      --  {
      --    wrap_results = true,
      --    prompt_prefix = " ",
      --    selection_caret = " ",
      --    path_display = {
      --      cwd = vim.fn.expand('%:p:h'),
      --    },
      --    preview = true,
      --    file_ignore_patterns = { "node_modules",".git",".cache","bin"},
      --  }),
        defaults = {
          wrap_results = true,
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = {
            cwd = vim.fn.expand('%:p:h'),
          },
          preview = true, -- Habilita la vista previa para live_grep
          file_ignore_patterns = { 
            "node_modules",
            ".git",
            ".cache",
            "bin",
            "bundle",
            ".dll",
          },
        },
      }
    require("telescope").load_extension("git_worktree")
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true, buffer = buf }

    keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>",opts)
    keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>",opts)
  end,
}

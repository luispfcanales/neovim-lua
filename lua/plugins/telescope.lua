return {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local themes = require "telescope.themes"

    require('telescope').setup {
      defaults = {
        wrap_results = true,
        prompt_prefix = " ",
        selection_caret = " ",
        --path_display = { cwd = vim.fn.expand('%:p:h') },
        path_display = { "truncate" },
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
    require("telescope").load_extension("notify")
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true, buffer = buf }

    keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>",opts)
    keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>",opts)
    keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>",opts)
  end,
}

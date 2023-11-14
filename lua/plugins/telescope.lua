return {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      return
    end
    local actions = require "telescope.actions"
    local themes = require "telescope.themes"

    telescope.setup {
      defaults = vim.tbl_extend(
        "force",
        themes.get_dropdown(),
        {
          wrap_results = true,
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = {
            cwd = vim.fn.expand('%:p:h'),
          },
          preview = false,
          file_ignore_patterns = { "node_modules",".git",".cache","bin"},

          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-c>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            },
          },
        }
      ),
      extensions = {
        lazy = {
          theme = "ivy",
          show_icon = true,
          mappings = {
            open_in_browser = "<C-o>",
            open_in_file_browser = "<M-b>",
            open_in_find_files = "<C-f>",
            open_in_live_grep = "<C-g>",
            open_in_terminal = "<C-t>",
            open_plugins_picker = "<C-b>", -- Works only after having called first another action
            open_lazy_root_find_files = "<C-r>f",
            open_lazy_root_live_grep = "<C-r>g",
            change_cwd_to_plugin = "<C-c>d",
          },
          -- Configuration that will be passed to the window that hosts the terminal
          terminal_opts = {
            relative = "editor",
            style = "minimal",
            border = "rounded",
            title = "Telescope lazy",
            title_pos = "center",
            width = 0.5,
            height = 0.5,
          },
          -- Other telescope configuration options
        },
      },
    }

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true, buffer = buf }
    --keymap.set("n","<leader>fc","<cmd>Telescope git_commits<CR>", opts)
    --keymap.set("n","<leader>fb","<cmd>Telescope git_branches<CR>", opts)

    ----search files in current proyect and display rootProyect/files
    keymap.set("n", "<C-p>", "<cmd>Telescope find_files<CR>",opts)
  end,
}

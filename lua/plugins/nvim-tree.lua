return {
  "nvim-tree/nvim-tree.lua",
  lazy=false,
  dependencies={"nvim-tree/nvim-web-devicons"},

  config = function()
    local status, tree = pcall(require,"nvim-tree")
    if not status then
      return
    end

    --vim.g.loaded_netrw = 1
    --vim.g.loaded_netrwPlugin = 1
    vim.g.vim_tree_open_on_tab = 1
    vim.g.nvim_tree_width_allow_resize = 1

    tree.setup({
      auto_reload_on_write = true,
      disable_netrw = false,
      hijack_netrw = false,
      renderer = {
        group_empty = false,
        add_trailing = false,
        icons = {
          glyphs = {
            default = '',
            symlink = '',
            git = {
              unstaged = '✗',
              staged = '✓',
              unmerged = '',
              renamed = '➜',
              untracked = '★',
              deleted = '',
              ignored = '◌',
            },
            folder = {
              default = '',
              open = '',
             -- arrow_open = '>',
             -- arrow_closed = '#',
              empty = ' ',
              empty_open = ' ',
              symlink = '',
              symlink_open = '',
            },
            --lsp = { hint = ' ', info = ' ', warning = ' ', error = ' ' },
          },
          padding = ' ',
        },
        indent_markers = { enable = true },
        root_folder_modifier = ':~',
        root_folder_label = false,
        highlight_opened_files = '3', -- adding
        highlight_git = true,
      },
      actions = {
        open_file = {
          window_picker = { enable = true },
          resize_window = true,
        },
      },

      diagnostics = {
        enable = false,
        icons = {
          hint = '',
          info = '',
          warning = '',
          error = '',
        },
      },

      update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
      },
      view = {
        width = 35,
        side = 'right',
        --auto_resize = false,
        --mappings = {
        --  custom_only = false,
        --  list = {},
        --},
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      filters = {
        dotfiles = false,
        custom = {'.git', '.cache',"node_modules",".exe"},
        exclude = {".gitignore"},
      },
    })

    local keymap = vim.keymap
    keymap.set('n', '<leader>d', ':NvimTreeToggle<CR>',{desc = "Toggle file Explorer"})
  end,
}

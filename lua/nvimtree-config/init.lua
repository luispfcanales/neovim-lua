vim.g.vim_tree_open_on_tab = 1
vim.g.nvim_tree_width_allow_resize = 1

require('nvim-tree').setup({
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
          arrow_open = '>',
          arrow_closed = '#',
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
    highlight_opened_files = '3', -- adding
    highlight_git = true,
  },
  actions = {
    open_file = {
      window_picker = { enable = true },
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
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {},
    },
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  filters = {
    dotfiles = false,
    custom = {'.git', '.cache'},
  },
})

--vim.cmd('highlight NvimTreeFolderIcon guibg=blue')

return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
      -- "permissions",    -- REMOVER para mejor rendimiento
      "size", 
      -- "mtime",         -- REMOVER para mejor rendimiento
    },
    skip_confirm_for_simple_edits = true,
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == ".." or name == ".git"
      end,
    },
    buf_options = {
      buflisted = false,
      bufhidden = "hide"
    },
    cleanup_delay_ms = 1000,
    use_default_keymaps = true,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup()

    vim.keymap.set("n", "<leader>fd", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "<A-d>", "<CMD>Oil .<CR>", { desc = "Open project directory" })
  end,
}

return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup()

    local function open_proyect_dir()
      local dir = vim.fn.getcwd()
      require("oil").open(dir)
    end

    vim.keymap.set("n", "<leader>fd", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "<A-d>", open_proyect_dir, { desc = "Open parent directory" })
  end,
}


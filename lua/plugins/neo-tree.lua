return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
      { "<leader>d", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  config = function()
    require("neo-tree").setup({
      open_on_setup = true,
      update_to_buf_dir = {
          enable = true,
      },
      auto_close = true,
      hijack_netrw = true,
      auto_open = true,
      open_on_tab = false,
      lsp_diagnostics = false,
    })
  end,
  --vim.g.neo_tree_side = 'right'
}

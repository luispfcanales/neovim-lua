return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local menu_width = 180

    if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
      menu_width = 190
    end

    require("harpoon").setup({
      menu = {
        width = menu_width,
      }
    })

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    keymap.set("n", "<A-m>", [[<cmd>lua require("harpoon.mark").add_file()<CR>]], opts)
    keymap.set("n", "<A-a>", [[<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]], opts)
    -- keymap.set("n", "<A-1>", [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]], opts)
  end,
}

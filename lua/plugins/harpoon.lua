return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("harpoon").setup({})

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    keymap.set("n", "<A-m>", [[<cmd>lua require("harpoon.mark").add_file()<CR>]],opts)
    keymap.set("n", "<A-a>", [[<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]],opts)
    keymap.set("n", "<A-1>", [[<cmd>lua require("harpoon.ui").nav_file(1)<CR>]],opts)
    keymap.set("n", "<A-2>", [[<cmd>lua require("harpoon.ui").nav_file(2)<CR>]],opts)
    keymap.set("n", "<A-3>", [[<cmd>lua require("harpoon.ui").nav_file(3)<CR>]],opts)
  end,
}

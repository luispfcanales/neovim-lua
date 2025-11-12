return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
  },
  config = function()
    require("go").setup()

    local format_sync_grp = vim.api.nvim_create_augroup("goimport", {})
    vim.api.nvim_create_autocmd("bufwritepre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimport()
      end,
      group = format_sync_grp,
    })

    local cmds = require('custom.commands')
    --golang format
    vim.keymap.set("n", "<leader>fs", "<cmd>GoFillStruct<cr>", { desc = "fill struct" })
    vim.keymap.set("n", "<leader>ad", "<cmd>GoAddTag<cr>", { desc = "add tags" })
    vim.keymap.set("n", "<leader>da", "<cmd>GoClearTag<cr>", { desc = "clear tags" })
    vim.keymap.set("n", "<leader>ei", "<cmd>goiferr<cr>", { desc = "ifeff completion" })
    vim.keymap.set("n", "<leader>rt", "<cmd>gotest -v<cr>", { desc = "run test" })
    -- vim.keymap.set("n", "<leader>gr", "<cmd>lua require'core.commands'.GoRunCMD()<cr>", { desc = "run app golang" })
    vim.keymap.set("n", "<leader>gr", cmds.run, { desc = "run app golang" })
  end,
  event = { "cmdlineenter" },
  ft = { "go", 'gomod' },
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}

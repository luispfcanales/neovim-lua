return{
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
  },
  config = function()
    require("go").setup()

    local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
       require('go.format').goimport()
      end,
      group = format_sync_grp,
    })
    --golang format
    vim.keymap.set("n", "<leader>fs", "<CMD>GoFillStruct<CR>", { desc = "Fill struct" })
    vim.keymap.set("n", "<leader>ad", "<CMD>GoAddTags<CR>", { desc = "Add tags" })
    vim.keymap.set("n", "<leader>da", "<CMD>GoClearTags<CR>", { desc = "Clear tags" })
    vim.keymap.set("n", "<leader>ei", "<CMD>GoIfErr<CR>", { desc = "IfEff completion" })
    vim.keymap.set("n", "<leader>rt", "<CMD>GoTest -v<CR>", { desc = "Run Test" })
    vim.keymap.set("n", "<leader>gr", "<CMD>lua require'core.commands'.GoRun()<CR>", { desc = "Run app golang" })


  end,
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}

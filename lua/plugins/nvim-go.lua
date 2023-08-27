return{
  "crispgm/nvim-go",
  config = function()
    require("go").setup({
      lint_prompt_style = 'vt',
      formatter = "gofmt",
    })
  end,
}
--vim.api.nvim_exec([[ autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 ]],false)

return {
  "ThePrimeagen/git-worktree.nvim",
  config = function()
    require('git-worktree').setup()
    vim.keymap.set(
      "n",
      "<leader>b",
      "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
      { desc = "Open parent directory" }
    )
  end,
}

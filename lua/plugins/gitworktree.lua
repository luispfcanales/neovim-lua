return {
  "ThePrimeagen/git-worktree.nvim",
  config = function()
    local Worktree = require("git-worktree")
    Worktree.setup({
      change_directory_command = "cd",
      update_on_change = true,
      update_on_change_command = "e .",
      clearjumps_on_change = true,
      autopush = false,  -- IMPORTANTE: false para evitar errores de upstream
    })

    vim.keymap.set(
      "n",
      "<leader>b",
      "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
      { desc = "Open parent directory" }
    )
    
    vim.keymap.set("n", "<C-w>", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", 
      { desc = "Create Git Worktree" })
  end,
}

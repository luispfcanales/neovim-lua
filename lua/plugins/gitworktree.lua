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


    vim.api.nvim_create_user_command("GWNew", function(opts)
      local name = opts.args
      
      -- Si no pasaron argumento, pedirlo
      if name == "" then
        name = vim.fn.input("Worktree name: ")
      end
      
      if name == "" then 
        print("✗ Cancelled")
        return 
      end
      
      -- Crear worktree sin configurar upstream
      local cmd = string.format("git worktree add %s -b %s", name, name)
      local result = vim.fn.system(cmd)
      
      if vim.v.shell_error == 0 then
        print("✓ Worktree created: " .. name)
        print("→ Next: cd " .. name .. " && npm install")
      else
        print("✗ Error creating worktree")
        print(result)
      end
    end, { nargs = "?", desc = "Create new worktree (simple)" })


    vim.keymap.set(
      "n",
      "<leader>b",
      "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
      { desc = "Open parent directory" }
    )
    -- En lugar de create_git_worktree(), usa este wrapper
    --vim.keymap.set("n", "<C-w>", ":GWNew ", { desc = "Create Git Worktree" })
    
    vim.keymap.set("n", "<C-w>", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", 
      { desc = "Create Git Worktree" })
  end,
}

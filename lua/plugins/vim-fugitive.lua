return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set('n', '<leader>z', "<cmd>Git<CR>")
    
    -- Redirigir mensajes de vim a notify
    local original_print = print
    print = function(...)
      local args = {...}
      local msg = table.concat(vim.tbl_map(tostring, args), " ")
      if msg:match("git") or msg:match("Git") then
        vim.notify(msg, vim.log.levels.INFO, { title = "Git" })
      end
      original_print(...)
    end
  end,
}

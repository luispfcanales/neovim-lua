return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    --[[ quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true }, ]]
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    -- Top Pickers & Explorer
    { "<a-p>",      function() Snacks.picker.smart() end,               desc = "Smart Find Files" },
    -- { "<leader>,",       function() Snacks.picker.buffers() end,         desc = "Buffers" },
    { "<c-g>",      function() Snacks.picker.grep() end,                desc = "Grep" },
    { "<leader>:",  function() Snacks.picker.command_history() end,     desc = "Command History" },
    { "<leader>n",  function() Snacks.picker.notifications() end,       desc = "Notification History" },
    { "<a-e>",      function() Snacks.explorer() end,                   desc = "File Explorer" },
    -- find
    { "<c-p>",      function() Snacks.picker.files() end,               desc = "Find Files" },
    -- git
    { "<leader>x",  function() Snacks.picker.git_diff() end,            desc = "Git Diff (Hunks)" },
    --searhc
    { "<leader>sm", function() Snacks.picker.marks() end,               desc = "Marks" },
    -- LSP
    { "gd",         function() Snacks.picker.lsp_definitions() end,     desc = "Goto Definition" },
    { "gi",         function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    -- Other
    { "<a-w>",      function() Snacks.lazygit() end,                    desc = "Lazygit" },
    { "<a-x>",      function() Snacks.bufdelete() end,                  desc = "Delete Buffer" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has("nvim-0.11") == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end
      end,
    })
  end,
}

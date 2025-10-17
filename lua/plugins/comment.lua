return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require('Comment').setup({
      padding = true,
      sticky = true,
      toggler = {
        line = "<A-c>",
        block = "gbc",
      },
      opleader = {
        line = "<A-c>",
        block = "<A-c>",
      },
      mappings = {
        basic = true,
        extra = true,
      },
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })
  end,
  lazy = false,
}

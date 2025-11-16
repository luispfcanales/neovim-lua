return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local triggerKey = "<a-c>"

    require('Comment').setup({
      padding = true,
      sticky = true,
      toggler = {
        line = triggerKey,
        block = "gbc",
      },
      opleader = {
        line = triggerKey,
        block = triggerKey,
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

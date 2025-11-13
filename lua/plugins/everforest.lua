return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    local everforest = require("everforest")
    everforest.setup({
      background = "soft",
    })
    everforest.load()
  end,
}

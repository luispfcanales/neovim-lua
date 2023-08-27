return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local status,pairs = pcall(require,'nvim-autopairs')
    if not status then
      return
    end
    pairs.setup{}
  end
}

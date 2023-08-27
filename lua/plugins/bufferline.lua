return {
  "akinsho/bufferline.nvim",
  version = "*",
  config = function()
    local status_ok,buff_line = pcall(require,"bufferline")
    if not status_ok then
      return
    end
    buff_line.setup{}
  end
}

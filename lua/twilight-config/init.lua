local status_ok , twi = pcall(require,"twilight")
if not status_ok then
  return
end
require("twilight").setup {
  {
    dimming = {alpha = 0.25, color = {"Normal", "#ffffff"}, inactive = true},
    context = 10,
    treesitter = true,
    expand = {"function", "method", "table", "if_statement"}
  }
}

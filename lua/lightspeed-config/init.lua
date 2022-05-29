-- disable keymappings by default
vim.cmd([[ let g:lightspeed_no_default_keymaps = 1 ]])
local status_ok , speed = pcall(require,"lightspeed")

if not status_ok then
  return
end

speed.setup{
  ignore_case = true,
}

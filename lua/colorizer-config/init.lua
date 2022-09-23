local status_ok,color = pcall(require,"colorizer")
if not status_ok then
  return
end
color.setup{
  filetypes = { 
    'javascript',
    'css',
    svelte = { mode = 'virtualtext'; }
  },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    rgb_fn = true,
    mode = "background",
    virtualtext = "■",
  },
}

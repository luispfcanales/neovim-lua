local status_ok, treesitter = pcall(require,"nvim-treesitter.configs")
if not status_ok then
  return
end
treesitter.setup {
  ensure_installed = { "go","svelte","javascript","typescript","css","json","lua" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
    filetypes = { "html" , "svelte" ,"javascript","javascriptreact" },
  },
  rainbow = {
    enable = true,
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  autopairs = {
    enable = true
  },
  indent = {
    enable = true
  }
}
--require('nvim-treesitter.install').compilers = {"cl","clang","gcc"}
require('nvim-treesitter.install').compilers = {"clang"}

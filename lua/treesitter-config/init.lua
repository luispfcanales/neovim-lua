require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go","svelte","html","javascript","typescript","css","json" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
    filetypes = { "html" , "svelte" },
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

return{
  {
  "nvim-treesitter/nvim-treesitter",
  event = {"BufReadPre","BufNewFile"},
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag"
  },

  config = function()
    local status_ok, treesitter = pcall(require,"nvim-treesitter.configs")
    if not status_ok then
      return
    end
    treesitter.setup({
      ensure_installed = { 
        "go","svelte","javascript","typescript","css",
        "json","lua","html","proto","markdown","vim",
        "dart","python", 
      },
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
        disable = {"go","html"},
      },
      autopairs = {
        enable = true
      },
      indent = {
        enable = true,
      },
      auto_install = true,
    })
  end,
  }
}

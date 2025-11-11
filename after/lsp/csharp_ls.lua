return {
  filetypes = { "cs", "vb" },
  root_markers = { "*.sln", "*.csproj", "global.json", ".git" },
  settings = {
    ["csharp-ls"] = {
      enable_roslyn_analysers = true,
      disable_format = false,
    },
  },
}

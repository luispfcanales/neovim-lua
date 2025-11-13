return {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'poetry.lock',
    '.git',
  },
  settings = {
    pylsp = {
      configurationSources = { "flake8" },
      plugins = {
        -- Autocompletado e inteligencia de código
        jedi = {
          enabled = true,
          extra_paths = {},
          environment = nil,
        },

        -- Linting
        pyflakes = { enabled = true },
        pylint = { enabled = false }, -- Deshabilitado por lento

        -- Style checking
        pycodestyle = {
          enabled = true,
          ignore = { 'W391', 'E203', 'E266', 'W503', 'W504' },
          maxLineLength = 120
        },

        -- Type checking (opcional)
        pylsp_mypy = {
          enabled = true,
          live_mode = false,
          dmypy = true, -- Más rápido
        },

        -- Formateo (opcional)
        black = {
          enabled = true,
          line_length = 120,
        },

        -- Import organization (opcional)
        pyls_isort = {
          enabled = true,
        },

        -- Análisis de complejidad
        mccabe = {
          enabled = true,
          threshold = 15,
        },

        -- Documentación
        pylsp_rope = {
          enabled = false, -- Puede ser lento
        }
      }
    }
  },
  single_file_support = true,
}

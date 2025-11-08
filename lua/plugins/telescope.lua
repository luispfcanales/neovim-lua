return {
  "nvim-telescope/telescope.nvim",
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Detectar qué comando de búsqueda está disponible
    local function get_find_command()
      if vim.fn.executable('fd') == 1 then
        return 'fd'
      elseif vim.fn.executable('fdfind') == 1 then
        return 'fdfind'
      else
        vim.notify("No se encontró fd ni fdfind, usando find como fallback", vim.log.levels.WARN)
        return 'find'
      end
    end

    local find_cmd = get_find_command()

    -- Configuración común para comandos de búsqueda
    local find_command_args = {
      find_cmd,
      "--type", "f",
      "--hidden",
      "--exclude", ".git",
      "--exclude", "bin",
      "--exclude", "obj",
      "--exclude", "packages",
      "--exclude", "node_modules",
      "--exclude", ".vs",
    }

    -- Si estamos usando find en lugar de fd, ajustar los argumentos
    if find_cmd == 'find' then
      find_command_args = { "find", ".", "-type", "f" }
    end

    require('telescope').setup {
      defaults = {
        wrap_results = true,
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
        preview = true,

        -- IGNORAR MASIVAMENTE para .NET
        file_ignore_patterns = {
          "node_modules",
          ".git",
          ".cache",
          "bin/",
          "obj/",
          "packages/",
          ".vs/",
          "_ReSharper%.",
          "%.dll$",
          "%.exe$",
          "%.pdb$",
          "%.cache$",
          "%.user$",
          "%.suo$",
          "bundle",
        },

        -- CONFIGURACIONES DE RENDIMIENTO
        cache_picker = {
          num_pickers = 10,
          limit_entries = 1000
        },

        layout_config = {
          width = 0.95,
          height = 0.85,
          preview_cutoff = 1,
        },

        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-c>"] = require("telescope.actions").close,
          },
        },
      },

      pickers = {
        find_files = {
          find_command = find_command_args,
          limit = 100,
        },

        live_grep = {
          -- LIMITAR grep para proyectos grandes
          additional_args = function(opts)
            return {
              "--max-depth=8",
              "--type=cs",
              "--type=json",
              "--type=xml",
              "--type=lua",
            }
          end,

          disable_coordinates = true,
          only_sort_text = true,
        },

        git_status = {
          git_icons = {
            added = "A",
            modified = "M",
            deleted = "D",
          }
        }
      }
    }

    require("telescope").load_extension("git_worktree")
    require("telescope").load_extension("notify")
    local build_t = require("telescope.builtin")

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    -- KEYMAPS OPTIMIZADOS CON DETECCIÓN AUTOMÁTICA
    keymap.set("n", "<C-p>", function()
      build_t.find_files({
        find_command = find_command_args,
        limit = 50,
      })
    end, opts)

    keymap.set("n", "<C-g>", function()
      build_t.live_grep({
        additional_args = function()
          return { "--max-depth=6" }
        end
      })
    end, opts)

    keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", opts)

    -- Búsqueda solo en C#
    keymap.set("n", "<leader>fc", function()
      build_t.live_grep({
        search_dirs = { "." },
        type_filter = "cs",
        additional_args = function()
          return { "--type=cs", "--max-depth=6" }
        end
      })
    end, { desc = "Grep C# files only" })

    keymap.set(
      'n',
      '<leader>gc',
      build_t.git_bcommits,
      { desc = '[G]it [C]ommits for current buffer' }
    )
  end,
}

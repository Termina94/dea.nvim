return {
  -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local top_picker = function(width, height)
      return {
        previewer = false,
        path_display = { truncate = 2 },
        hidden = true,
        border = true,
        prompt_title = false,
        results_title = false,
        sorting_strategy = 'ascending',
        layout_config = {
          anchor = 'N',
          prompt_position = 'top',
          height = height,
          width = width,
        },
      }
    end

    require('telescope').setup {
      pickers = {
        git_files = top_picker(0.5, 0.3),
        find_files = { hidden = true },
        live_grep = {
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
      },
      defaults = {
        file_ignore_patterns = {
          'node_modules',
          'var',
          'assets',
        },
        hidden = true,
        layout_config = {
          horizontal = {
            preview_width = 0.5,
          },
        },
        path_display = { truncate = 2 },
        layout_strategy = 'horizontal',
        mappings = {
          i = {
            ['<C-q>'] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
          },
          n = {
            ['<C-q>'] = require('telescope.actions').smart_send_to_qflist + require('telescope.actions').open_qflist,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Custom Pickers
    local function file_select_picker()
      require('telescope.builtin').find_files(top_picker(0.5, 0.3))
    end

    require('telescope').extensions.file_select = file_select_picker

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.loaded_netrwPlugin = 0
vim.opt.spell = true
vim.opt.spelllang = 'en_gb'

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 2

require 'config.options'
require 'config.autocmds'
require 'config.commands'

require('lazy').setup('plugins', {
  change_detection = {
    notify = false,
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

require 'config.keymaps'

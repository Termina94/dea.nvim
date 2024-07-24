return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').add {
      { '<leader>f', group = 'Find' },
      { '<leader>l', group = 'LSP' },
      { '<leader>g', group = 'Git' },
      { '<leader>gh', group = 'Hunks' },
      { '<leader>c', group = 'Commands' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>y', group = 'Yank' },
      { '<leader>e', group = 'Explorer' },
      { '<leader>d', group = 'Diff View' },
    }
    -- visual mode
    require('which-key').add({
      { '<leader>f', name = 'Find' },
    }, { mode = 'v' })
  end,
}

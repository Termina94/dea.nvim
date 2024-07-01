return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>f'] = { name = 'Find', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = 'LSP', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = 'Git', _ = 'which_key_ignore' },
      ['<leader>gh'] = { name = 'Hunks', _ = 'which_key_ignore' },
      ['<leader>b'] = { name = 'Buffers', _ = 'which_key_ignore' },
      ['<leader>c'] = { name = 'Commands', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = 'Toggle', _ = 'which_key_ignore' },
    }
    -- visual mode
    require('which-key').register({
      ['<leader>f'] = { name = 'Find', _ = 'which_key_ignore' },
    }, { mode = 'v' })
  end,
}

return {
  'Exafunction/windsurf.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('codeium').setup {
      virtual_text = {
        enabled = true,
        key_bindings = {
          next_key = '<C-n>',
          prev_key = '<C-p>',
        },
      },
    }
  end,
}

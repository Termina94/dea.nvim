return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
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

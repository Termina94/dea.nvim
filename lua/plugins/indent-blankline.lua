return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    local highlight = {
      'IndentBlanklineChar',
    }

    local hooks = require 'ibl.hooks'
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#292929' })
    end)

    require('ibl').setup { indent = { highlight = highlight } }
  end,
}

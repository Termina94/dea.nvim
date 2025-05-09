return {
  'shaunsingh/nord.nvim',
  priority = 1000,
  init = function()
    vim.cmd.hi 'Comment gui=none'

    vim.g.nord_disable_background = true

    require('nord').set()

    vim.cmd.colorscheme 'nord'

    vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#355765' })
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#283b4d' })
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#3d2c3c' })
    vim.api.nvim_set_hl(0, 'DiffText', { bg = '#355765' })
  end,
}

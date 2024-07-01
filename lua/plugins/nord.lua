return {
  'shaunsingh/nord.nvim',
  priority = 1000,
  init = function()
    -- vim.g.nord_uniform_diff_background = true
    vim.cmd.hi 'Comment gui=none'

    require('nord').set()

    vim.cmd.colorscheme 'nord'
  end,
}

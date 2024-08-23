return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  -- opts = {
  --   transparent = true,
  --   styles = {
  --     sidebars = 'transparent',
  --     floats = 'transparent',
  --   },
  -- },
  init = function()
    vim.cmd.colorscheme 'tokyonight-night'
    vim.cmd.hi 'Comment gui=none'
  end,
}

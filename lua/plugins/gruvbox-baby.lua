-- lua/plugins/colorscheme.lua
return {
  {
    'luisiacc/gruvbox-baby',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_baby_background_color = 'dark'
      vim.g.gruvbox_baby_telescope_theme = 1
      vim.cmd 'colorscheme gruvbox-baby'
    end,
  },
}

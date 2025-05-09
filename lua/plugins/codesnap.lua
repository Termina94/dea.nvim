return {
  'mistricky/codesnap.nvim',
  build = 'make',
  config = function()
    require('codesnap').setup {
      code_font_family = 'Hack Nerd Font',
      watermark = '',
      mac_window_bar = false,
      bg_color = '#535c68',
      -- has_breadcrumbs = true,
      -- has_line_number = true,
    }
  end,
}

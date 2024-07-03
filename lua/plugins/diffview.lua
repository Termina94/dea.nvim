return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup {
      enhanced_diff_hl = true,
      show_help_hints = false,
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
      diff_binaries = false, -- Show diffs for binaries
      use_icons = true, -- Requires nvim-web-devicons
    }

    vim.opt.fillchars:append { diff = ' ' }
  end,
}

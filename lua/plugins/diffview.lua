return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup {
      diff_binaries = false, -- Show diffs for binaries
      use_icons = true, -- Requires nvim-web-devicons
    }

    -- Highlight groups for diffview, similar to VSCode
    -- vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#28403b' })
    -- vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#4b5a2c' })
    -- vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#4d1f1d', bg = '#4d1f1d' })
    -- vim.api.nvim_set_hl(0, 'DiffText', { bg = '#273a4c' })
    --
    -- vim.api.nvim_set_hl(0, 'DiffviewFilePanelTitle', { fg = '#ffd700', bg = '#1c1c1c' })
    -- vim.api.nvim_set_hl(0, 'DiffviewFilePanelCounter', { fg = '#ff4500', bg = '#1c1c1c' })
    -- vim.api.nvim_set_hl(0, 'DiffviewFilePanelFileName', { fg = '#00ff00', bg = '#1c1c1c' })
    -- vim.api.nvim_set_hl(0, 'DiffviewDiffAddAsDelete', { fg = '#00ffff', bg = '#1c1c1c' })
    -- vim.api.nvim_set_hl(0, 'DiffviewDiffDelete', { fg = '#ff0000', bg = '#1c1c1c' })
  end,
}

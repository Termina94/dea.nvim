return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.g.barbar_auto_setup = false

      local opts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap('n', '<A-]>', '<Cmd>BufferNext<CR>', opts)
      vim.api.nvim_set_keymap('n', '<A-[>', '<Cmd>BufferPrevious<CR>', opts)
      vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}

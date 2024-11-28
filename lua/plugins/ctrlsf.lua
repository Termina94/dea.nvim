return {
  {
    'dyng/ctrlsf.vim',
    config = function()
      vim.keymap.set('n', '<leader>sf', function()
        local search_term = vim.fn.input 'Search: '

        vim.fn.setreg('/', search_term)
        vim.cmd('CtrlSF ' .. search_term)
        vim.cmd 'CtrlSFFocus'
      end, { desc = 'Search and display' })
    end,
  },
}

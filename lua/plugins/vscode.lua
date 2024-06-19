return {
  'Mofiqul/vscode.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'vscode'
  end,
}

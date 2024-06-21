-- Function to get the current buffer's file name without the extension
local function get_current_filename_without_extension()
  local filename = vim.fn.expand '%:t:r'
  return filename
end

-- Function to copy the command to the clipboard
function _G.copy_migration_command_to_clipboard()
  -- Options for the user to select
  local options = { '--up', '--down' }

  -- Prompt the user to select an option
  vim.ui.select(options, { prompt = 'Select migration direction:' }, function(choice)
    if choice then
      local current_filename = get_current_filename_without_extension()
      local command = string.format("bin/console doctrine:migrations:execute %s 'DoctrineMigrations\\%s'", choice, current_filename)

      -- Use Neovim's clipboard to copy the command
      vim.fn.setreg('+', command)
      print('Copied to clipboard: ' .. command)
    else
      print 'No selection made.'
    end
  end)
end

-- Copy migration command to clipboard
vim.api.nvim_set_keymap('n', '<leader>cm', ':lua copy_migration_command_to_clipboard()<CR>', { desc = 'Migration Command', noremap = true, silent = true })

-- Define the function to prompt for a commit message and run git commit
_G.git_commit = function()
  local commit_message = vim.fn.input 'Commit message: '

  if commit_message == '' then
    print 'Aborting commit: no commit message provided.'
    return
  end

  -- Execute the commands
  vim.cmd('!' .. 'git add .')
  vim.cmd('!' .. string.format('git commit -m "%s"', commit_message))
end

vim.api.nvim_set_keymap('n', '<leader>cc', ':lua git_commit()<CR>', { desc = 'Git commit', noremap = true, silent = true })

-- Define the function to prompt for a branch name and create branch
_G.git_create_branch = function()
  local branch_name = vim.fn.input 'Branch name: '

  if branch_name == '' then
    print 'Aborting commit: no branch name provided.'
    return
  end

  -- Execute the commands
  vim.cmd('!' .. string.format('git checkout -m "%s"', branch_name))
  vim.cmd('!' .. string.format('git push --set-upstream origin "%s"', branch_name))
end

vim.api.nvim_set_keymap('n', '<leader>cb', ':lua git_create_branch()<CR>', { desc = 'Create Branch', noremap = true, silent = true })

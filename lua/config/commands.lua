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

--#region
--#region
--#region
--#region
--#region
--#region
--#region

-- Define the function to prompt for a commit message and run git commands
_G.git_commit = function()
  -- Use the input function to prompt for a commit message
  local commit_message = vim.fn.input 'Commit message: '

  -- Check if the commit message is not empty
  if commit_message == '' then
    print 'Aborting commit: no commit message provided.'
    return
  end

  -- Define the commands to be run
  local add_command = 'git add .'
  local commit_command = string.format('git commit -m "%s"', commit_message)

  -- Execute the commands
  vim.cmd('!' .. add_command)
  vim.cmd('!' .. commit_command)
end

-- Create a keybind to call the git_commit function
vim.api.nvim_set_keymap('n', '<leader>gc', ':lua git_commit()<CR>', { noremap = true, silent = true })

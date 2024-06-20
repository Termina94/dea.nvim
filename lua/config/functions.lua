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

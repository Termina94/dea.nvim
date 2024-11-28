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

  branch_name = branch_name:gsub('%s+', '-')

  -- Execute the commands
  vim.cmd('!' .. string.format('git checkout -b "%s"', branch_name))
  vim.cmd('!' .. string.format('git push --set-upstream origin "%s"', branch_name))
end

vim.api.nvim_set_keymap('n', '<leader>cb', ':lua git_create_branch()<CR>', { desc = 'Create Branch', noremap = true, silent = true })

local get_selection = function()
  -- Get the start and end positions of the visual selection
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"

  -- Extract lines from start to end
  local lines = vim.fn.getline(start_pos[2], end_pos[2])

  -- If the selection is within a single line
  if #lines == 1 then
    lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
  else
    -- Adjust the start and end lines
    lines[1] = string.sub(lines[1], start_pos[3])
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
  end

  -- Concatenate the lines into a single string
  return table.concat(lines, '\n')
end

_G.find_current_selection = function()
  -- Search for the selected text using Telescope
  require('telescope.builtin').grep_string { search = get_selection() }
end

_G.global_search_word = function()
  local input = vim.fn.input 'Search: '

  -- Search for the selected text using Telescope
  require('telescope.builtin').grep_string { search = input }
end

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
vim.keymap.set('n', ']D', vim.diagnostic.open_float, { desc = 'Diagnostic Messages' })
vim.keymap.set('n', '[D', vim.diagnostic.setloclist, { desc = 'Diagnostic Quickfix' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>n', ':tabnew ~/Documents/Notes/notes.md<CR>:vsplit ~/Documents/Notes/TODO.md<CR>', { desc = 'Notes' })

-- quick save
vim.keymap.set('n', '<C-S>', ':wa<CR>', { desc = 'Save all' })
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save' })

-- new lines above and below
vim.keymap.set('n', '[<space>', ':call append(line(".")-1, "")<CR>', { desc = 'Save all' })
vim.keymap.set('n', ']<space>', ':call append(line("."), "")<CR>', { desc = 'Save all' })

-- Tab navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Git
vim.keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>', { desc = 'Blame Line' })
vim.keymap.set('n', '<leader>gB', ':Git blame<CR>', { desc = 'Blame File' })

vim.keymap.set('n', '<leader>ghp', ':Gitsigns preview_hunk<CR>', { desc = 'Preview Hunk' })
vim.keymap.set('n', '<leader>ghr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset Hunk' })
vim.keymap.set('n', '<leader>ghs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage Hunk' })
vim.keymap.set('n', '<leader>ghu', ':Gitsigns undo_stage_hunk<CR>', { desc = 'Undo Stage Hunk' })

vim.keymap.set('n', '<leader>gg', ':Telescope git_status<CR>', { desc = 'Git Status' })
vim.keymap.set('n', '<leader>go', ':Telescope git_branches<CR>', { desc = 'Open Branch' })
vim.keymap.set('n', '<leader>gc', ':Telescope git_bcommits<CR>', { desc = 'Commits (File)' })
vim.keymap.set('n', '<leader>gC', ':Telescope git_commits<CR>', { desc = 'Commits (Branch)' })
vim.keymap.set('n', '<leader>gf', ':Telescope git_files<CR>', { desc = 'Git Files' })
vim.keymap.set('n', '<leader>gs', ':Telescope git_stash<CR>', { desc = 'Git Stashes' })
vim.keymap.set('n', '<leader>gy', ':let @+=system("git branch --show-current")<CR>', { desc = 'Yank Branch' })

vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<CR>', { desc = 'Git Diff' })

-- Neotree
vim.keymap.set('n', '<leader>ee', ':Neotree toggle<CR>', { desc = 'Toggle' })
vim.keymap.set('n', '<leader>ec', ':Neotree close<CR>', { desc = 'Toggle' })
vim.keymap.set('n', '<leader>er', ':Neotree reveal<CR>', { desc = 'Reveal' })
vim.keymap.set('n', '<leader>ef', ':Neotree focus<CR>', { desc = 'Focus' })
vim.keymap.set('n', '<leader>eb', ':Neotree buffers<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>eg', ':Neotree git_status<CR>', { desc = 'Git Status' })

-- DB
vim.keymap.set('n', '<leader>D', ':tabnew<CR>:DBUI<CR>', { desc = 'Open Diffs' })

-- Diffview
vim.keymap.set('n', '<leader>dd', ':DiffviewOpen<CR>', { desc = 'Open Diffs' })
vim.keymap.set('n', '<leader>dc', ':DiffviewClose<CR>', { desc = 'Close Diffs' })
vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory %<CR>', { desc = 'Diff History (File)' })
vim.keymap.set('n', '<leader>dH', ':DiffviewFileHistory<CR>', { desc = 'Diff History (Branch)' })

-- Navigation
vim.keymap.set('n', ']b', ':tabn<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '[b', ':tabp<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', 'L', ':bn<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', 'H', ':bp<CR>', { desc = 'Previous Buffer' })

-- Toggle
vim.keymap.set('n', '<leader>tn', ':set invnumber<CR>', { desc = 'Numbers' })
vim.keymap.set('n', '<leader>tw', ':set wrap!<CR>', { desc = 'Wrap Text' })
vim.keymap.set('n', '<leader>tr', ':set relativenumber!<CR>', { desc = 'Relative Numbers' })

-- Yank
vim.keymap.set('n', '<leader>yr', ':let @+ = expand("%") .. "\\nLine: " .. line(".")<CR>', { desc = 'Reference' })
vim.keymap.set('n', '<leader>yf', ':let @+ = expand("%")<CR>', { desc = 'File' })
vim.keymap.set('n', '<leader>yc', ':normal ggVGy<CR>', { desc = 'Content' })
vim.keymap.set('n', '<leader>yu', ':let @+ = "bin/phpunit " .. expand("%")<CR>', { desc = 'Unit Test' })

-- Hunk navigation
vim.keymap.set('n', '[g', ':Gitsigns prev_hunk<CR>', { desc = 'Next Hunk' })
vim.keymap.set('n', ']g', ':Gitsigns next_hunk<CR>', { desc = 'Previous Hunk' })

-- Telescope
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', ":lua require('telescope').extensions.file_select{}<CR>", { desc = 'Files' })
vim.keymap.set('n', '<leader>fe', builtin.find_files, { desc = 'Explore Files' })
vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Current Word' })
vim.keymap.set('v', '<leader>fc', ':lua find_current_selection()<CR>', { desc = 'Selection' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Words' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>fW', ':lua global_search_word()<CR>', { desc = 'Words in file' })
vim.keymap.set('n', '<leader>f<Enter>', builtin.resume, { desc = 'Resume' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent Files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffer' })
vim.keymap.set('n', '<leader>fh', ':Telescope find_files hidden=true no_ignore=true<CR>', { desc = 'Hidden' })

-- Commands
vim.keymap.set('n', '<leader>cf', ':%!jq .', { desc = 'JSON Format' })

-- vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help' })
-- vim.keymap.set('n', '<leader>ft', builtin.builtin, { desc = 'Telescope' })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Search Current Buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>f/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Buffers',
  }
end, { desc = 'Words in buffers' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>fn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Neovim files' })

vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })
vim.keymap.set('n', ']D', vim.diagnostic.open_float, { desc = 'Diagnostic Messages' })
vim.keymap.set('n', '[D', vim.diagnostic.setloclist, { desc = 'Diagnostic Quickfix' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- quick save
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<C-S>', ':wa<CR>', { desc = 'Save all' })

-- new lines above and below
vim.keymap.set('n', '[<space>', ':call append(line(".")-1, "")<CR>', { desc = 'Save all' })
vim.keymap.set('n', ']<space>', ':call append(line("."), "")<CR>', { desc = 'Save all' })

-- set numbers to relative
vim.keymap.set('n', '<leader>1', ':set relativenumber!<CR>', { desc = 'Numbers' })

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

vim.keymap.set('n', '<leader>gd', ':Gvdiffsplit<CR>', { desc = 'Git Diff' })

-- Neotree
vim.keymap.set('n', '<leader>e', ':Neotree reveal<CR>', { desc = 'Neotree' })

-- Buffer navigation
vim.keymap.set('n', ']b', ':tabn<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '[b', ':tabp<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', 'L', ':bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', 'H', ':bprevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>bn', ':enew<CR>', { desc = 'New Buffer' })
vim.keymap.set('n', '<leader>bf', ':Telescope buffers previewer=false<cr>', { desc = 'Find Buffer' })
vim.keymap.set('n', '<leader>be', ':Telescope buffers<CR>', { desc = 'Explore Buffers' })
vim.keymap.set('n', '<leader>bc', ':tabclose<CR>', { desc = 'Close Buffer' })
vim.keymap.set('n', '<leader>bo', ':tabonly<CR>', { desc = 'Close Others' })

-- Toggle
vim.keymap.set('n', '<leader>tn', ':set invnumber<CR>', { desc = 'Numbers' })
vim.keymap.set('n', '<leader>tw', ':set wrap!<CR>', { desc = 'Numbers' })

-- Disabled because barbar was being buggy
--
-- Buffer close menu
-- vim.keymap.set('n', '<leader>bC', 'which_key_ignore', { desc = 'Close' })
-- vim.keymap.set('n', '<leader>bCo', ':BufferCloseAllButCurrentOrPinned<CR>', { desc = 'Close Others' })
-- vim.keymap.set('n', '<leader>bCa', ':BufferCloseAllButPinned<CR>', { desc = 'Close All' })
-- vim.keymap.set('n', '<leader>bC<', ':BufferCloseBuffersLeft<CR>', { desc = 'Close All Left' })
-- vim.keymap.set('n', '<leader>bC>', ':BufferCloseBuffersRight<CR>', { desc = 'Close All Right' })
-- vim.keymap.set('n', '<leader>bb', ':BufferPick<CR>', { desc = 'Quick Buffer' })
-- vim.keymap.set('n', '<leader>bCs', ':BufferPickDelete<CR>', { desc = 'Select Buffer' })

-- Hunk navigation
vim.keymap.set('n', '[g', ':Gitsigns prev_hunk<CR>', { desc = 'Next Hunk' })
vim.keymap.set('n', ']g', ':Gitsigns next_hunk<CR>', { desc = 'Previous Hunk' })

-- -- Bookmarks
-- local bm = require 'bookmarks'
-- vim.keymap.set('n', '<leader>m', 'which_key_ignore', { desc = 'Marks' })
-- vim.keymap.set('n', '<leader>mf', ':Telescope bookmarks list<cr>', { desc = 'Find' })
-- vim.keymap.set('n', '<leader>mm', bm.bookmark_toggle, { desc = 'Mark' })
-- vim.keymap.set('n', '<leader>me', bm.bookmark_ann, { desc = 'Edit' })
-- vim.keymap.set('n', '<leader>mc', bm.bookmark_clean, { desc = 'Clean' })
-- vim.keymap.set('n', '<leader>mn', bm.bookmark_next, { desc = 'Next' })
-- vim.keymap.set('n', '<leader>mb', bm.bookmark_prev, { desc = 'Back' })
-- vim.keymap.set('n', '<leader>ml', ':Telescope bookmarks list previewer=false<cr>', { desc = 'List' })
-- vim.keymap.set('n', '<leader>mx', bm.bookmark_clear_all, { desc = 'Clear All' })

-- Telescope
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find Keymaps' })
vim.keymap.set('n', '<leader>ff', ":lua require('telescope').extensions.file_select{}<CR>", { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fe', builtin.find_files, { desc = 'Explore Files' })
vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = 'Find Select Telescope' })
vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Find current Word' })
vim.keymap.set('v', '<leader>fc', ':lua find_current_selection()<CR>', { desc = 'Find selection' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Find by words' })
vim.keymap.set('n', '<leader>fW', ':lua global_search_word()<CR>', { desc = 'Find words 2' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find Diagnostics' })
vim.keymap.set('n', '<leader>f<Enter>', builtin.resume, { desc = 'Find Resume' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find Buffer' })

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
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '/ in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>fn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Search Neovim files' })

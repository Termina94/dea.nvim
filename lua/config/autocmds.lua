-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Auto reload files when modified externally
vim.o.autoread = true
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI', 'FocusGained' }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { '*' },
})

-- Ensure the `qf` keymap is set only for quickfix buffers
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    -- Set the keymap for the qf filetype
    vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', ':cc<CR>', { noremap = true, silent = true })
  end,
})

-- Disable Treesitter highlighting for large files
vim.api.nvim_create_autocmd('BufReadPre', {
  callback = function(args)
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    local ok, stat = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
    local file_size = ok and stat and stat.size or 0

    -- Thresholds (tweak as you like)
    local max_lines = 10000
    local max_bytes = 2 * 1024 * 1024 -- 2 MB

    if line_count > max_lines or file_size > max_bytes then
      -- Disable Treesitter highlighting (if available)
      pcall(function()
        require('vim.treesitter.highlight').disable(args.buf)
      end)

      -- Turn off syntax highlighting
      pcall(vim.cmd, 'syntax off')

      -- Disable indent-blankline (if present)
      vim.b[args.buf].indent_blankline_enabled = false

      -- Stop LSP clients attached to this buffer
      for _, client in pairs(vim.lsp.get_active_clients { bufnr = args.buf }) do
        vim.lsp.stop_client(client.id)
      end

      -- Disable indent-blankline
      vim.b[args.buf].indent_blankline_enabled = false

      -- Disable nvim-cmp completion
      vim.b[args.buf].cmp_enabled = false

      -- Disable autopairs + autotag
      vim.g.autopairs_enabled = false
      vim.g.autotag_enabled = false

      -- Disable Codeium
      vim.g.codeium_enabled = false

      -- Disable Copilot
      vim.g.copilot_enabled = false

      -- Disable Conform (formatter on save)
      vim.b[args.buf].conform_disable = true

      -- Disable Gitsigns (can be slow on large files)
      package.loaded['gitsigns'] = nil

      -- Disable telescope previewers (large previews can hang)
      vim.g.telescope_previewer_enabled = false

      -- Optional: snippets + mini plugins that expand per buffer
      vim.b[args.buf].luasnip_disable = true
      vim.g.mini_enabled = false

      -- Optional: tell yourself what's happening
      vim.notify('Large file detected (' .. line_count .. ' lines). Heavy plugins disabled.', vim.log.levels.WARN)
    end
  end,
})

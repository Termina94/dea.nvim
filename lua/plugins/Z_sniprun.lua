return {
  'michaelb/sniprun',
  branch = 'master',

  build = 'sh install.sh 1',
  -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

  config = function()
    require('sniprun').setup {
      -- your options
    }
  end,
}

return {
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'GBrowse' },
    keys = {
      { '<leader>gs', '<cmd>Git<cr>', desc = 'Git status' },
      { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git commit' },
      { '<leader>gp', '<cmd>Git push<cr>', desc = 'Git push' },
      { '<leader>gl', '<cmd>Git pull<cr>', desc = 'Git pull' },
      { '<leader>gd', '<cmd>Gdiffsplit<cr>', desc = 'Git diff' },
      { '<leader>gb', '<cmd>Git blame<cr>', desc = 'Git blame' },

      -- Origin URL helpers (Fugitive)
      { '<leader>go', '<cmd>GBrowse<cr>', desc = 'Open file on origin', mode = 'n' },
      { '<leader>gO', '<cmd>GBrowse!<cr>', desc = 'Copy file URL to clipboard', mode = 'n' },

      -- visual: selected lines (range-aware)
      { '<leader>go', ":'<,'>GBrowse<cr>", desc = 'Open on origin (selection)', mode = 'x' },
      { '<leader>gO', ":'<,'>GBrowse!<cr>", desc = 'Copy URL (selection)', mode = 'x' },
    },
  },
  { 'tpope/vim-rhubarb', dependencies = { 'tpope/vim-fugitive' } }, -- adds GBrowse handler for GitHub
}

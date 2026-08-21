-- ~/.config/nvim/lua/plugins/diffview.lua  (lazy.nvim spec)
return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory' },
  keys = {
    -- Core entry points
    { '<leader>dv', '<cmd>DiffviewOpen<cr>', desc = 'Diff working tree' },
    { '<leader>dq', '<cmd>DiffviewClose<cr>', desc = 'Close diffview' },
    { '<leader>dp', '<cmd>DiffviewOpen origin/main...HEAD<cr>', desc = 'Diff PR vs main (merge base)' },
    { '<leader>dh', '<cmd>DiffviewFileHistory %<cr>', desc = 'History: current file' },
    { '<leader>dH', '<cmd>DiffviewFileHistory<cr>', desc = 'History: repo' },
    -- Prompt for an arbitrary ref/range
    {
      '<leader>dr',
      function()
        local ref = vim.fn.input('Diff against ref/range: ', 'origin/main...HEAD')
        if ref ~= '' then
          vim.cmd('DiffviewOpen ' .. ref)
        end
      end,
      desc = 'Diff against ref',
    },
  },
  opts = {
    enhanced_diff_hl = true, -- nicer word-level highlights
    view = {
      default = { layout = 'diff2_horizontal', winbar_info = true },
      merge_tool = { layout = 'diff3_mixed' },
    },
    file_panel = {
      listing_style = 'tree',
      win_config = { position = 'left', width = 35 },
    },
    keymaps = {
      view = {
        { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close' } },
        { 'n', '<tab>', '<cmd>DiffviewToggleFiles<cr>', { desc = 'Toggle file panel' } },
        {
          'n',
          ']f',
          '<cmd>DiffviewNextEntry<cr>',
          { desc = 'Next file' },
          -- fallback below if your version lacks these commands
        },
        {
          'n',
          'gf',
          function()
            require('diffview.actions').goto_file_edit()
          end,
          { desc = 'Open real file (LSP works here)' },
        },
        {
          'n',
          '<leader>co',
          function()
            require('diffview.actions').conflict_choose 'ours'
          end,
          { desc = 'Conflict: choose ours' },
        },
        {
          'n',
          '<leader>ct',
          function()
            require('diffview.actions').conflict_choose 'theirs'
          end,
          { desc = 'Conflict: choose theirs' },
        },
        {
          'n',
          '<leader>cb',
          function()
            require('diffview.actions').conflict_choose 'base'
          end,
          { desc = 'Conflict: choose base' },
        },
        {
          'n',
          '<leader>ca',
          function()
            require('diffview.actions').conflict_choose 'all'
          end,
          { desc = 'Conflict: choose all' },
        },
      },
      file_panel = {
        { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close' } },
        { 'n', '<tab>', '<cmd>DiffviewToggleFiles<cr>', { desc = 'Toggle file panel' } },
        { 'n', 'cc', '<cmd>tab Git commit<cr>', { desc = 'Commit (fugitive)' } },
      },
      file_history_panel = {
        { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close' } },
      },
    },
  },
}

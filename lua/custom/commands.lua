local function toggleTodo()
  local line = vim.api.nvim_get_current_line()

  local changed, n = line:gsub('- %[ %]', '- [x]', 1)

  if n == 0 then
    changed, n = line:gsub('- %[x%]', '- [ ]', 1)
  end

  vim.api.nvim_set_current_line(changed)
end
vim.api.nvim_create_user_command('ToggleTodo', toggleTodo, {})
vim.keymap.set('n', '<leader>tt', ':ToggleTodo<CR>', { noremap = true, silent = true, desc = '[T]oggle [Todo]' })

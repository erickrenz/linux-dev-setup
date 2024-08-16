vim.keymap.set('n', '-', vim.cmd.Ex)

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

vim.keymap.set('n', '<C-s>', function()
  vim.notify('Lazy sync...', vim.log.levels.INFO)
  require('lazy').sync { wait = true, show = false }
  vim.cmd [[MasonUpdate]]
end)

vim.keymap.set('n', '<leader>w', function()
  -- toggle word wrap
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.wo.linebreak = false
  else
    vim.wo.wrap = true
    vim.wo.linebreak = true
  end
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'html', 'markdown', 'text' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'en_us'
    vim.opt_local.spellsuggest = '9'
    vim.opt_local.spellfile = os.getenv 'HOME' .. '/.vim/spellfile.utf-8.add'
  end,
})

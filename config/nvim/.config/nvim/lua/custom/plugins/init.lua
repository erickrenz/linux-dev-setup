return {
  -- navigate seemlessly between panes
  'christoomey/vim-tmux-navigator',

  -- detect tabstop and shift width automatically
  'tpope/vim-sleuth',

  -- git decorations for changed lines
  { 'lewis6991/gitsigns.nvim', opts = {} },

  -- add indentation guides even on blank lines
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}

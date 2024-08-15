return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('trouble').setup {
      warn_no_results = false,
      open_no_results = true,
    }

    vim.keymap.set('n', '<leader>t', function()
      vim.cmd [[Trouble diagnostics toggle focus=true]]
    end)
  end,
}

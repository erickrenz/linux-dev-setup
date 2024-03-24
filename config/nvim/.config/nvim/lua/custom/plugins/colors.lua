return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup {
      style = 'night',
      on_colors = function() end,
      on_highlights = function() end,
    }
    vim.cmd.colorscheme 'tokyonight'
  end,
}

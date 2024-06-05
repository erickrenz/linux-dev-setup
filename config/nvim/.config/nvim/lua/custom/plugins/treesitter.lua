return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'c',
        'cpp',
        'go',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'rust',
        'tsx',
        'typescript',
      },

      sync_install = false,
      auto_install = true,

      indent = { enable = true, disable = { 'python' } },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'markdown' },
      },
    }
  end,
}

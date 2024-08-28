return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('my-lsp-attach', { clear = true }),
      callback = function(event)
        local opts = { buffer = event.buf }
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id), 'must have valid client')

        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help, opts)

        -- return from definition using CTRL-O (see :h CTRL-O)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)

        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

        vim.diagnostic.config {
          float = {
            focusable = false,
            source = true,
            style = 'minimal',
            border = 'rounded',
            header = '', -- "Diagnostics:"
            prefix = '', -- "1. "
          },
        }

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          vim.keymap.set('n', '<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }, { bufnr = event.buf })
          end, opts)
        end

        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('my-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('my-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'my-lsp-highlight', buffer = event2.buf }
            end,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      clangd = {},
      cpptools = {},
      delve = {},
      debugpy = {},
      gopls = {
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              fieldalignment = true,
              unusedparams = true,
              unusedvariable = true,
              unusedwrite = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },
      -- ltex = {},
      lua_ls = {},
      pyright = {},
      rust_analyzer = {},
      tsserver = {},
      zls = {
        settings = {
          zls = {
            enable_inlay_hints = true,
            enable_snippets = true,
            warn_style = true,
          },
        },
      },
    }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}

-- {
--     'barreiroleo/ltex_extra.nvim',
-- },

--   -- Spell/Grammar Checker
--   ['ltex'] = function()
--     require("lspconfig").ltex.setup {
--       capabilities = capabilities,
--       on_attach = function()
--         require("ltex_extra").setup({
--           load_langs = { 'en-US' },
--           path = '.vscode', -- path = vim.fn.expand('~') .. '/.local/share/ltex',
--         })
--       end,
--       settings = {
--         ltex = {
--           completionEnabled = true,
--           language = "en-US",
--         },
--       },
--       filetypes = { "markdown", "tex", "gitcommit", "mail", "plaintex", "rst" },
--     }
--   end
-- }

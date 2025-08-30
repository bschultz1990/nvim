return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    -- Mason must be loaded before its dependents so we need to set it up here.
    -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
    { 'mason-org/mason.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Allows extra capabilities provided by blink.cmp
    'saghen/blink.cmp',
  },
  event = 'InsertEnter',
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
        vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { desc = '[G]oto Code [A]ction' })
        vim.keymap.set('n','<leader>gr',require('telescope.builtin').lsp_references, { desc =  '[G]oto [R]eferences' })
        vim.keymap.set('n','<leader>gi',require('telescope.builtin').lsp_implementations, { desc =  '[G]oto [I]mplementation' })
        vim.keymap.set('n','<leader>gd',require('telescope.builtin').lsp_definitions, { desc =  '[G]oto [D]efinition' })
        vim.keymap.set('n','<leader>gD',vim.lsp.buf.declaration, { desc =  '[G]oto [D]eclaration' })
        vim.keymap.set('n','<leader>ds',require('telescope.builtin').lsp_document_symbols, { desc =  'Open [D]ocument [S]ymbols' })
        vim.keymap.set('n','<leader>ws',require('telescope.builtin').lsp_dynamic_workspace_symbols, { desc =  'Open [W]orkspace [S]ymbols' })
        vim.keymap.set('n','<leader>gt',require('telescope.builtin').lsp_type_definitions, { desc =  '[G]oto [T]ype Definition' })
      end,
    })

    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    local servers = {
      pyright = {},
      html = {},
      lua_ls = {
        -- cmd = { ... },
        -- filetypes = { ... },
        -- capabilities = {},
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- diagnostics = { disable = { 'missing-fields' } }, -- Disable lua's noisy 'missing fields' report
          },
        },
      },
    }

    -- Ensure the servers and tools above are installed
    -- `mason` had to be setup earlier: to configure its options see the
    -- `dependencies` table for `nvim-lspconfig` above.
    --
    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
      'tree-sitter-cli'
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}

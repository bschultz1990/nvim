-- Is there an lspconfig in the house?
local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then return end
----------------------------------------
-- connect to servers
-- read more at :h vim.lsp.buf<TAB>
-- Need more servers?
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
----------------------------------------

Servers = {'tsserver', 'sumneko_lua'}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for i, lsp in ipairs(Servers) do
  require('lspconfig')[lsp].setup{
  on_attach = function()
    capabilities=capabilities
    print(lsp..' ATTACHED! :D')
    nmap('<C-k>','vim.lsp.buf.hover')
    nmap('gd','vim.lsp.buf.definition')
    nmap('gD','vim.lsp.buf.declaration')
    nmap('<leader>r','vim.lsp.buf.rename')
    nmap('gr','vim.lsp.buf.references')
    nmap('<C-d>','vim.diagnostic.open_float(nil, {focus=false})')

    vim.diagnostic.config({
      virtual_text=false -- disable diag text unless summoned.
    })
    if (lsp == 'sumneko_lua') then
      local settings = {
	Lua = {
	  runtime = {
	    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
	    version = 'LuaJIT',
	  },
	  diagnostics = {
	    -- Get the language server to recognize the `vim` global
	    globals = {'vim'},
	  },
	  workspace = {
	    -- Make the server aware of Neovim runtime files
	    library = vim.api.nvim_get_runtime_file("", true),
	  },
	  telemetry = {enable = false,},
	},
      }
    end
  end
  }
end




-- Template:
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }


-- for i, lsp in ipairs(Servers) do
--   require('lspconfig')['lsp'].setup{
--     capabilities=capabilities
--   }
-- end
-- Setup nvim-cmp.
  vim.opt.completeopt = {"menu", "menuone", "noselect"}
  local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'nvim_lua' },
    }),
    experimental = {
      native_menu = false,
      ghost_text = true,
    }
  })

  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['tsserver'].setup {
  -- }

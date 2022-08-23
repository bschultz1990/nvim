-- Is there an lspconfig in the house?
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
vim.notify("lspconfig not found.", "error")
  return
end

----------CONNECT TO SERVERS------------
-- read more at :h vim.lsp.buf<TAB>
-- Need more servers?
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
----------------------------------------
Servers = {'tsserver', 'sumneko_lua'}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for i, lsp in pairs(Servers) do
  require('lspconfig')[lsp].setup{
  on_attach = function()
    capabilities=capabilities
    print(lsp.. ' attached')
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer=0})
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)

    vim.diagnostic.config({
      virtual_text=false -- disable diag text unless summoned.
    })
  end
  }
end

require ('lspconfig').sumneko_lua.setup {
  settings = {
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
      telemetry = {enable = false},
    },
  }
}

--------------NVIM-CMP--------------
-- Setup nvim-cmp.
vim.opt.completeopt = {"menu", "menuone", "noselect"}
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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

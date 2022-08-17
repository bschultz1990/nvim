-- connect to servers
-- read more at :h vim.lsp.buf<TAB>

-- Need more servers?
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local nvim_lsp = require('lspconfig')
local servers = {'tsserver', 'sumneko_lua'}

for i, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{
    on_attach = function()
    nmap('<C-k>','vim.lsp.buf.hover')
    nmap('gd','vim.lsp.buf.definition')
    nmap('gD','vim.lsp.buf.declaration')
    nmap('<leader>r','vim.lsp.buf.rename')
    nmap('gr','vim.lsp.buf.references')
  end,
  }

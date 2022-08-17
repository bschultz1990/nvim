-- connect to servers
-- read more at :h vim.lsp.buf<TAB>

-- Need more servers?
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local nvim_lsp = require('lspconfig')
local servers = {'tsserver', 'sumneko_lua'}

for i, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup{
    on_attach = function(var)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
  end,
  }

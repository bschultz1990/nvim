-- connect to servers
-- read more at :h vim.lsp.buf<TAB>
require('lspconfig').tsserver.setup{
  on_attach = function()
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
  end,
}

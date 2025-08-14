-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp

vim.lsp.enable('pyright')
vim.lsp.enable('bashls')
vim.lsp.enable('cssls')
vim.lsp.enable('emmet_language_server')
vim.lsp.enable('html')
vim.lsp.enable('tinymist')
vim.lsp.enable('typescript-language-server')



vim.lsp.config['lua_ls'] = {
  settings = {
    Lua = { diagnostics = { globals = { "vim" }, }, }
  }
}
vim.lsp.enable('lua_ls')

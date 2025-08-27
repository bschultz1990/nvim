return { 'neovim/nvim-lspconfig',
dependencies = { "williamboman/mason.nvim",
opts = {
  ensure_installed = {
    "bash-language-server",
    "css-lsp",
    "emmet-language-server",
    "html-lsp",
    "lua-language-server",
    "powershell-editor-services",
    "prettier",
    "pyright",
    "stylua",
    "tinymist",
    "typescript-language-server",
  },
}
, 'saghen/blink.cmp' },
config = function ()
  -- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
  local capabilities = require('blink.cmp').get_lsp_capabilities()

  vim.lsp.enable('pyright')
  vim.lsp.enable('bashls')
  vim.lsp.enable('cssls')
  vim.lsp.enable('emmet_language_server')
  vim.lsp.enable('html')
  vim.lsp.enable('tinymist')
  vim.lsp.enable('typescript-language-server')


  vim.lsp.config['lua_ls'] = {
    capabilities = capabilities,
    settings = {
      Lua = { diagnostics = { globals = { "vim" }, }, }
    }
  }
  vim.lsp.enable('lua_ls')
end
}

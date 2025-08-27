return {
  "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  dependencies = {
    -- main one
    { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
    -- - shell repl
    -- - nvim lua api
    -- - scientific calculator
    -- - comment banner
    -- - etc
  },
  init = function()
    vim.g.coq_settings = {
      auto_start = true, -- if you want to start COQ at startup
      -- Your COQ settings here
    }
  end,
  config = function ()
    -- LSPCONFIG here
    -- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
    local coq = require "coq"
    capabilities = coq.lsp_ensure_capabilities()

    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.enable('pyright')
    vim.lsp.enable('bashls')
    vim.lsp.enable('cssls')
    vim.lsp.enable('emmet_language_server')
    vim.lsp.enable('html')
    vim.lsp.enable('tinymist')
    vim.lsp.enable('typescript-language-server')


    vim.lsp.config['lua_ls'] = {
      settings = {
        capabilities = capabilities,
        Lua = { diagnostics = { globals = { "vim" }, }, }
      }
    }
    vim.lsp.enable('lua_ls')
  end
}

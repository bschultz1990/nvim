local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "bashls",
  "cssls",
  "html",
  "pyright",
  "ts_ls",
  "emmet_language_server"
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server: nvlsp
-- lspconfig.nvlsp.setup {}
  -- on_attach = nvlsp.on_attach,
  -- on_init = nvlsp.on_init,
  -- capabilities = nvlsp.capabilities,


-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "bashls", "powershell_es" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

local pwsh_services = vim.fn.expand("/mason/packages/powershell-editor-services")
local pwsh_bundlepath = vim.fn.stdpath "data" .. pwsh_services

--powershell_es
lspconfig.powershell_es.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  bundle_path = pwsh_bundlepath,
}

-- bash
lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "zsh", "bash" },
}

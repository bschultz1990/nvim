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

local pwsh_startpath = vim.fn.expand("/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1")
local pwsh_services = vim.fn.expand("/mason/packages/powershell-editor-services")
local pwsh_bundlepath = vim.fn.stdpath "data" .. pwsh_services
local pwsh_start_script = vim.fn.stdpath "data" .. pwsh_startpath

--powershell_es
lspconfig.powershell_es.setup {
  filetypes = { "ps1", "psm1", "psd1" },
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  -- bundle_path = pwsh_bundlepath,
  cmd = { 'pwsh', '-NoLogo', '-NoProfile', '-Command', pwsh_start_script },
  init_options = { enableProfileLoading = false }
}

-- bash
lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "zsh", "bash" },
}

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

local bundlepath = vim.fn.stdpath "data" .. "/mason/packages/powershell-editor-services/PowerShellEditorServices/"

--powershell_es
lspconfig.powershell_es.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  bundle_path = bundlepath,
  cmd = { "pwsh", "-NoLogo", "-NoProfile", "-Command", bundlepath .. "Start-EditorServices.ps1" },
}

-- bash
lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "zsh", "bash" },
}

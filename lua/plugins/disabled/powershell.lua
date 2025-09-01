-- FOR USE WITH NATIVE NVIM-LSPCONFIG AND MASON

local pwsh_bundlepath = vim.fn.stdpath "data" .. pwsh_services

return   {
  "TheLeoP/powershell.nvim",
  ---@type powershell.user_config
  ft = { "ps1" },
  opts = { bundle_path = pwsh_bundlepath },
  config = function()
    require("powershell").setup {
      bundle_path = pwsh_bundlepath,
    }
  end,
}

local pwsh_services = vim.fn.expand "/mason/packages/powershell-editor-services"
local pwsh_bundlepath = vim.fn.stdpath "data" .. pwsh_services

vim.pack.add({
  {
    src = 'https://github.com/TheLeoP/powershell.nvim',
    load = false,
  },
})


vim.api.nvim_create_autocmd("BufEnter", {
  desc = "ENTER THE POWERSHELL BEEBLEBROX!",
  pattern = "*.ps1", -- filetype
  group = vim.api.nvim_create_augroup("PowerShellEnterGroup", { clear = true }),
  callback = function(opts)
    require('powershell').setup({
      bundle_path = pwsh_bundlepath,
    })
  end,
})

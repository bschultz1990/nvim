-- Open help in a new tab.
vim.api.nvim_create_user_command("H", function(opts)
  vim.cmd('tab help ' .. opts.fargs[1])
end, { desc = "Open help in a new tab.", nargs = 1 })



-- Open help in a vertical window
vim.api.nvim_create_user_command("Hv", function(opts)
  vim.cmd('help ' .. opts.fargs[1])
  vim.cmd('wincmd L')
end, { desc = "Open help in a vertical window", nargs = 1 })

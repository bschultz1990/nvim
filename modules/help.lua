-- Open help in a new tab.
vim.api.nvim_create_user_command("H", function(opts)
  vim.cmd('tab help ' .. opts.fargs[1])
end, { nargs = 1 })




-- Open help in a vertical window
vim.api.nvim_create_user_command("Hv", function(opts)
  vim.cmd('help ' .. opts.fargs[1])
  vim.cmd('wincmd L')
end, { nargs = 1 })




-- TODO: Open help in a floating window.
vim.api.nvim_create_user_command("Hf", function(opts)
  local buf = vim.api.nvim_create_buf(true,false)
  local win_opts = {
    relative = 'editor',
    width = 75,
    height = 25,
    col = math.floor((vim.o.columns - 75) / 2),
    row = math.floor((vim.o.lines - 25) / 2),
    border = 'rounded'
  }
  local win_id = vim.api.nvim_open_win(buf, false, win_opts)
  vim.api.nvim_set_current_win(win_id)
  -- vim.cmd('tab help ' .. opts.fargs[1])
end, { nargs = 1 })

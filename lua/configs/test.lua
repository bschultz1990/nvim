-- Define highlight group for the active split
vim.api.nvim_command('highlight ActiveSplit guibg=#031A2F')

-- Function to set the active split highlight
function set_active_split_highlight()
  -- Get the ID of the active window and buffer
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(win)
  
  -- Loop through all windows and highlight the active split
  for _, w in pairs(vim.api.nvim_list_wins()) do
    if w == win then
      vim.api.nvim_win_set_option(w, 'winhighlight', 'Normal:ActiveSplit')
    else
      vim.api.nvim_win_set_option(w, 'winhighlight', 'Normal:Normal')
    end
  end
end

-- Set the active split highlight when the cursor moves
vim.api.nvim_command('autocmd CursorMoved * call v:lua.set_active_split_highlight()')
-- #02101D
-- #031A2F

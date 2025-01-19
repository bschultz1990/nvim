vim.api.nvim_create_user_command("RS", function()
  vim.api.nvim_command 'normal! gv"zy'
  local selected_text = vim.fn.getreg "z"
  local clean_text = selected_text:gsub(" +%| +", "|"):gsub("%| +", "|"):gsub(" +%|", "|"):gsub("|", " ")

  local lines = vim.split(clean_text, "\n")

  for i, line in ipairs(lines) do
    lines[i] = line:gsub("^ +", ""):gsub(" +$", "")
  end

  local final_text = table.concat(lines, "\n")
  vim.fn.setreg("+", final_text)
  print(final_text)
end, { nargs = 0, range = true })

vim.api.nvim_create_user_command("Preview", function()
  local buf_number = vim.api.nvim_get_current_buf()
  local buf_path = vim.api.nvim_buf_get_name(buf_number)

  vim.ui.open(buf_path)
end, { nargs = 0 })

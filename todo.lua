vim.api.nvim_create_user_command("Todo", function()
  local todo_path = vim.fn.expand("~/Documents/notes/todo.md")
  if not vim.loop.fs_stat(todo_path) then
    print("Todos empty")
    return
  end
  vim.cmd("100vs "..todo_path)
end, { nargs = 0 })

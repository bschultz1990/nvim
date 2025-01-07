Session_dir = vim.fn.expand("~/Documents/nvim_sessions/")
Session_file = vim.fn.expand(Session_dir .. '/sessions.txt')

vim.api.nvim_create_user_command('Sessions', function()
  if not vim.loop.fs_stat(Session_file) then
    vim.fn.mkdir(Session_dir, "p")
    vim.fn.writefile({}, Session_file)
    print("Session file created. Run :Session to get started.")
    return
  end

  local lines = {}
  for line in io.lines(Session_file) do
    table.insert(lines, line)
  end

  require('telescope.pickers').new({}, {
    prompt_title = "Select a Session",
    finder = require('telescope.finders').new_table { results = lines },
    sorter = require('telescope.sorters').get_fzy_sorter(),
    attach_mappings = function(_, map)
      map('i', '<CR>', function(prompt_bufnr)
        local selection = require('telescope.actions.state').get_selected_entry()
        if selection then
          vim.cmd("cd ".. selection.value)
          print('Session loaded: ' .. selection.value)
        end
        require('telescope.actions').close(prompt_bufnr)
      end)
      return true
    end
  }):find()
end, { nargs = 0 })


vim.api.nvim_create_user_command('Session', function()

end, { nargs = 0 })

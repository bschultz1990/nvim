vim.api.nvim_create_user_command("Warp", function()
  local session_dir = vim.fn.expand "~/Documents/nvim_sessions/"
  local session_file = vim.fn.expand(session_dir .. "/sessions.txt")
  if not vim.loop.fs_stat(session_file) then
    vim.fn.mkdir(session_dir, "p")
    vim.fn.writefile({}, session_file)
    print "Session file created. Run :WarpNew to get started."
    return
  end

  local lines = {}
  for line in io.lines(session_file) do
    table.insert(lines, line)
  end

  require("telescope.pickers").new({}, {
      prompt_title = "Select a Session",
      finder = require("telescope.finders").new_table { results = lines },
      sorter = require("telescope.sorters").get_fzy_sorter(),
      attach_mappings = function(_, map)
        map("i", "<CR>", function(prompt_bufnr)
          local selection = require("telescope.actions.state").get_selected_entry()
          if selection then
            vim.cmd("cd " .. selection.value)
            print("Session loaded: " .. selection.value)
          end
          require("telescope.actions").close(prompt_bufnr)
        end)
        return true
      end,
    })
    :find()
end, { nargs = 0 })

-- vim.api.nvim_create_user_command("WarpNew", function() end, { nargs = 0 })

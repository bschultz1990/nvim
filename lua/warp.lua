Warp_dir = vim.fn.expand "~/Documents/nvim_sessions/"
Warp_file = vim.fn.expand(Warp_dir .. "sessions.txt")


vim.api.nvim_create_user_command("Warp", function()
  if not vim.loop.fs_stat(Warp_file) then
    vim.fn.mkdir(Warp_dir, "p")
    vim.fn.writefile({}, Warp_file)
    print "Session file created. Run :WarpEdit to get started."
    return
  end

  local lines = {}
  for line in io.lines(Warp_file) do
    table.insert(lines, line)
  end
  require("telescope.pickers")
  .new({}, {
    prompt_title = "Select a Warp Point",
    finder = require("telescope.finders").new_table { results = lines },
    sorter = require("telescope.sorters").get_fzy_sorter(),
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        if selection then
          vim.cmd("cd " .. selection.value)
          print("Warped to: " .. selection.value)
        end
        require("telescope.actions").close(prompt_bufnr)
      end)
      return true
    end,
  })
  :find()
end, { desc="Change working directory based on your favorites", nargs = 0 })


vim.api.nvim_create_user_command("WarpEdit", function()
  local file = io.open(Warp_file)
  local fileSize = file:seek "end"
  file:close()
  if fileSize == 0 then
    print "Warp message: File is blank. Write one directory per line (ex. ~/Desktop/)."
  end
  print(fileSize)
  vim.cmd("10split " .. Warp_file)
end, { desc = "Edit favorite warp points", nargs = 0 })

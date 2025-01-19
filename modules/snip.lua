-- Dynamically append snippets from multiple locations.
if not Snipmate_path then
  Snipmate_path = {}
end

table.insert(Snipmate_path, vim.fn.stdpath "config" .. vim.fn.expand "/lua/user/snippets/")
vim.g.snipmate_snippets_path = Snipmate_path



local function ft_check(newfile, ft)
  if not vim.loop.fs_stat(newfile .. ft .. ".snippets") then
    vim.fn.writefile({}, newfile .. ft .. ".snippets")
  end
end

vim.api.nvim_create_user_command("Snip", function()
  local filetype = vim.o.filetype
  require("telescope.pickers")
    .new({}, {
      prompt_title = "Snippets Directories",
      finder = require("telescope.finders").new_table { results = Snipmate_path },
      sorter = require("telescope.sorters").get_fzy_sorter(),
      attach_mappings = function(_, map)
        map("i", "<CR>", function()
          local selection = require("telescope.actions.state").get_selected_entry()
          if selection then
            vim.cmd "vs"
            ft_check(selection.value, filetype)
            require("telescope.builtin").find_files { cwd = selection.value, }
          end
        end)
        return true
      end,
    })
    :find()
end, { nargs = 0 })

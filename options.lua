vim.o.cursorlineopt = "both" -- to enable cursorline!
vim.o.colorcolumn = "100"

-- Highlight text on yank.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})


-- Save session to directory via custom Session command
Session_dir = vim.fn.expand("~/Documents/vim_sessions/")
vim.api.nvim_create_user_command("Session", function(opts)
  if not vim.loop.fs_stat(Session_dir) then
    vim.fn.system("mkdir -p " .. Session_dir)
  end
  vim.cmd("mksession! " .. Session_dir .. opts.fargs[1] .. ".vim")
  print("Session '" .. opts.fargs[1] .. ".vim' created in " .. Session_dir)
end, { nargs = 1 })


-- Oooh, birrrd, tweak that code!
vim.api.nvim_create_user_command("Config", function()
  local config_path = vim.fn.stdpath('config')
  vim.cmd("cd " .. config_path)
  vim.cmd("Telescope find_files")
end, { nargs = 0 }
)


-- Plugin development mojo
vim.api.nvim_create_user_command("Test", function()
  local config_path = vim.fn.stdpath('config')
  local test_path = vim.fn.expand(config_path .. "/lua/plugins/test.lua")
  if not vim.loop.fs_stat(test_path) then
    vim.fn.system("touch -p " .. test_path)
  end
  vim.cmd('edit ' .. test_path)
  print("DELETE THE TEST FILE WHEN YOU'RE DONE.")
end, { nargs = 0 })


vim.api.nvim_create_user_command("RS", function()
  vim.api.nvim_command("normal! gv\"zy")
  local selected_text = vim.fn.getreg("z")
  local clean_text = selected_text
    :gsub(" +%| +", "|")
    :gsub("%| +", "|")
    :gsub(" +%|", "|")
    :gsub("|", " ")

  local lines = vim.split(clean_text, '\n')

  for i, line in ipairs(lines) do
    lines[i] = line
      :gsub("^ +", "")
      :gsub(" +$", "")
  end

  local final_text = table.concat(lines, '\n')
  vim.fn.setreg("+", final_text)
  print(final_text)
end, { nargs = 0, range = true })

-- Snippet goodness
vim.g.snipmate_snippets_path = vim.fn.stdpath "config" .. "/lua/user/snippets/"

vim.cmd("set foldlevel=99")

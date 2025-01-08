vim.o.cursorlineopt = "both" -- to enable cursorline!
-- vim.o.colorcolumn = "100" -- line length limit

if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.o.shell = "powershell.exe"
end

-- Highlight text on yank.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
  end,
})

-- -- Save session to directory via custom Session command
-- Session_dir = vim.fn.expand "~/Documents/vim_sessions/"
-- vim.api.nvim_create_user_command("Session", function(opts)
--   if not vim.loop.fs_stat(Session_dir) then
--     vim.fn.system("mkdir -p " .. Session_dir)
--   end
--   vim.cmd("mksession! " .. Session_dir .. opts.fargs[1] .. ".vim")
--   print("Session '" .. opts.fargs[1] .. ".vim' created in " .. Session_dir)
-- end, { nargs = 1 })

-- Oooh, birrrd, tweak that code!
vim.api.nvim_create_user_command("Config", function(opts)
  local user_config_path = vim.fn.stdpath "config" .. "/lua/user/"
  if string.lower(opts.fargs[1]) == "grep" then
    require("telescope.builtin").live_grep {
      cwd = user_config_path,
    }
  elseif string.lower(opts.fargs[1]) == "files" then
    require("telescope.builtin").find_files {
      cwd = user_config_path,
    }
  elseif string.lower(opts.fargs[1]) == "dir" then
    vim.cmd("cd " .. user_config_path)
    require("telescope.builtin").find_files {
      cwd = user_config_path,
    }
  end
end, {
  nargs = 1,
  complete = function(ArgLead, CmdLine, CursorPos)
    -- return completion candidates as a list-like table
    return { "grep", "files", "dir" }
  end,
})

-- TODO: Find the current file type. Search in snippets directory for filetype.snippets.
-- If it doesn't exist, create it in the proper directory.
-- Then, open it to the right.
vim.api.nvim_create_user_command("Snip", function()
  vim.cmd "vs"
  require("telescope.builtin").find_files {
    cwd = vim.fn.stdpath "config" .. "/lua/user/snippets",
  }
end, { nargs = 0 })


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

-- Snippet goodness
vim.g.snipmate_snippets_path = vim.fn.stdpath "config" .. "/lua/user/snippets/"

vim.cmd "set foldlevel=99"

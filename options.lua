vim.o.cursorlineopt = "both" -- to enable cursorline!
vim.o.signcolumn = "no" -- No left margin
vim.o.foldlevel = 99
vim.o.wrap = false

-- TODO: Keybind in markdown files to bold and italicize selected text
-- TODO: Auto trigger nvim-cmp in command mode. No tab needed.

if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.o.shell = "powershell.exe"
end


vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "BufWinEnter", "BufWinLeave", "BufDelete" }, {
  desc = "Highlight matching brackets in IncSearch hl group.",
  pattern = "*", -- any filetype
  callback = function()
    vim.api.nvim_set_hl(0, "MatchParen", { link = "IncSearch" })
    if require("nvconfig").base46.theme == "solarized_osaka" then
      -- vim.api.nvim_set_hl(0, "MatchParen", { bg = 'orange' })
      -- vim.api.nvim_set_hl(0, "MatchParen", { link = "PmenuSel" })
      vim.api.nvim_set_hl(0, "MatchParen", { link = "TermCursor" })
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Autocreate a dir when saving a file",
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match "^%w%w+:[\\/][\\/]" then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- vim.api.nvim_create_user_command("Bold", function()
-- TODO: Make this operate on a selected range.
--   vim.api.nvim_command 'normal! gv'
--   vim.api.nvim_command 'S*'
--   vim.api.nvim_command 'normal! gv'
--   vim.api.nvim_command 'S*'
-- end, { desc = "Bold highlgihted text using Vim Surround", nargs = 0 })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Hightlight selection on yank",
  pattern = "",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 500 }
  end,
})

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
  end
end, {
  desc = "Configure Neovim files without changing your working directory",
  nargs = 1,
  complete = function()
    return { "grep", "files" } -- return completion candidates as a list-like table
  end,
})

vim.api.nvim_create_user_command("Todo", function()
  local todo_path = vim.fn.expand "~/Documents/notes/todo.md"
  if not vim.loop.fs_stat(todo_path) then
    print "Todos empty"
    return
  end
  vim.cmd("66vs " .. todo_path)
end, { desc = "Open a todo list split to the right", nargs = 0 })

-- TODO: Search for TODO, FIXME, BUG, etc...
-- TODO: Add todo, fixme, highlight groups based on todo-comments.nvim
vim.api.nvim_create_user_command("Todos", function()
  vim.cmd "vimgrep /TODO: /*"
  vim.cmd "copen"
end, { desc = "Show TODO comments in the current project", nargs = 0 })

-- TODO Nix the file name / path result with a custom vimgrep formatter function
vim.api.nvim_create_user_command("Toc", function()
  if vim.o.filetype ~= "markdown" then print "Not a Markdown file." return end
  vim.cmd "vimgrep /^#\\+/ %"
  vim.cmd "copen"
end, { desc = "View table of contents in Markdown", nargs = 0 })

vim.api.nvim_create_user_command("Preview", function()
  local buf_number = vim.api.nvim_get_current_buf()
  local buf_path = vim.api.nvim_buf_get_name(buf_number)

  vim.ui.open(buf_path)
end, { desc = "Preview the current active buffer in the default app", nargs = 0 })

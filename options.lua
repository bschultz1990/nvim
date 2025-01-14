vim.o.cursorlineopt = "both" -- to enable cursorline!
vim.o.signcolumn = "no"-- No left margin

if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.o.shell = "powershell.exe"
end


vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "BufWinEnter", "BufWinLeave" }, {
    desc = "Highlight matching brackets in IncSearch hl group.",
    pattern = "*", -- any filetype
    callback = function()
        vim.api.nvim_set_hl(0, "MatchParen", { link = "IncSearch" })
        -- TODO: If NvChad theme = Solarized Osaka, highlight in orange instead.
        -- vim.api.nvim_set_hl(0, "MatchParen", { guibg = 'orange' })
    end
})


vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Hightlight selection on yank",
  pattern = "*",
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
  nargs = 1,
  complete = function()
    return { "grep", "files" } -- return completion candidates as a list-like table
  end,
})



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


vim.api.nvim_create_user_command('Preview', function()
  local buf_number = vim.api.nvim_get_current_buf()
  local buf_path = vim.api.nvim_buf_get_name(buf_number)

  vim.ui.open(buf_path)

end, { nargs = 0 })



-- Snippet goodness. Can be a list of paths.
Snipmate_path = {}
table.insert(Snipmate_path, vim.fn.stdpath "config" .. "/lua/user/snippets/")
table.insert(Snipmate_path, "~/Desktop/snippets/")
for _, value in ipairs(Snipmate_path) do
  print(value)
end

vim.g.snipmate_snippets_path = Snipmate_path

-- TODO: Find the current file type. Search in snippets directory for filetype.snippets.
-- If it doesn't exist, create it in the proper directory.
-- Then, open it to the right.

-- TODO: Make a Telescope picker like with Warp.
-- Include all directories from vim.g.snipmate_snippets_path.
-- Upon selection, THEN cwd into that path instead of hard-coding it.
-- This will allow for multiple snippets directories.

-- for index, value in ipairs(vim.g.snipmate_snippets_path) do
--   print(value)
-- end

vim.api.nvim_create_user_command("Snip", function()
  vim.cmd "vs"
  require("telescope.builtin").find_files {
    cwd = vim.fn.stdpath "config" .. "/lua/user/snippets",
  }
end, { nargs = 0 })

vim.cmd "set foldlevel=99"


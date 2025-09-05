-- Auto complete
-- Might not need with blink.cmp
-- vim.cmd("set pumheight=20")

-- Disable completions from current buffer
-- vim.api.nvim_create_autocmd('BufEnter', {
--   pattern = '*',
--   callback = function()
--     vim.b.completion = false
--   end,
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Autocreate a dir when saving a file",
  group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Hightlight selection on yank",
  pattern = "",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
  end,
})

-- Oooh, birrrd, tweak that code!
vim.api.nvim_create_user_command("Config", function(opts)
  local user_config_path = vim.fn.stdpath("config")

  if string.lower(opts.fargs[1]) == "grep" then
    require("telescope.builtin").live_grep({
      cwd = user_config_path,
    })
  elseif string.lower(opts.fargs[1]) == "files" then
    require("telescope.builtin").find_files({
      cwd = user_config_path,
    })
  end
end, {
    desc = "Configure Neovim files without changing your working directory",
    nargs = 1,
    complete = function()
      return { "grep", "files" } -- return completion candidates as a list-like table
    end,
  })

vim.api.nvim_create_user_command("Reload", function()
  vim.cmd("luafile" .. vim.fn.stdpath('config') .. "/init.lua")
end, { nargs = 0 })

vim.api.nvim_create_user_command("Todos", function()
  vim.cmd("vimgrep /TODO: /*")
  vim.cmd("copen")
end, { desc = "Show TODO comments in the current project", nargs = 0 })

-- TODO Nix the file name / path result with a custom vimgrep formatter function
vim.api.nvim_create_user_command("Toc", function()
  if vim.o.filetype ~= "markdown" then
    print("Not a Markdown file.")
    return
  end
  vim.cmd("vimgrep /^#\\+/ %")
  vim.cmd("copen")
end, { desc = "View table of contents in Markdown", nargs = 0 })

vim.api.nvim_create_user_command("Preview", function()
  local buf_number = vim.api.nvim_get_current_buf()
  local buf_path = vim.api.nvim_buf_get_name(buf_number)
  vim.ui.open(buf_path)
end, { desc = "Preview the current active buffer in the default app", nargs = 0 })

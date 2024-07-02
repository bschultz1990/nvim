require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.scrolloff = 5

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
  print('Session "' .. opts.fargs[1] .. '.vim" created in ' .. Session_dir)
end, { nargs = 1 })

-- Oooh, birrrd, tweak that code!
vim.api.nvim_create_user_command("Config", function()
  local config_path = vim.fn.stdpath('config')
  vim.cmd("cd " .. config_path)
  vim.cmd("Telescope find_files")
end, { nargs = 0 }
)

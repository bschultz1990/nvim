require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!


-- Highlight text on yank.
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
  })


-- Function to check if a folder exists
local function folder_exists(folder_path)
  local f = io.open(folder_path, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

-- Save session to directory via custom Session command
Session_dir = "~/Documents/vim_sessions/"
vim.api.nvim_create_user_command("Session", function(opts)
  if not folder_exists(Session_dir) then
    os.execute("mkdir " .. Session_dir)
  end
  vim.cmd("mksession! " .. Session_dir .. opts.fargs[1] .. ".vim")
  print('Session "' .. opts.fargs[1] .. '.vim" created in ' .. Session_dir)
end, { nargs = 1 })

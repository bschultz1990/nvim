function Shebang(cmd)
  local env = io.popen(cmd):read("*a")
  env = string.sub(env, 1, -2) -- cut out the newline character
  io.close() -- close the file handle
  return env
end

vim.g.viewoptions = 'options'
local remember_folds = vim.api.nvim_create_augroup('remember_folds', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWinLeave', 'BufWritePost' }, {
    pattern = '*.*',
    group = remember_folds,
    command = 'if &ft !=# "help" | mkview | endif',
  })

vim.api.nvim_create_autocmd({ 'BufWinEnter', 'BufWritePost'}, {
    pattern = '*.*',
    group = remember_folds,
    command = 'if &ft !=# "help" | silent! loadview | endif',
  })

-- manual	    Folds are created manually.
-- indent	    Lines with equal indent form a fold.
-- expr	    'foldexpr' gives the fold level of a line.
-- marker	    Markers are used to specify folds.
-- syntax	    Syntax highlighting items specify folds.
-- diff	    Fold text that is not changed.

-- Highlight text on yank.
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Hightlight selection on yank',
    pattern = '*',
    callback = function()
      vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
    end,
  })

-- Open help files in a new tab.
vim.api.nvim_create_user_command('H', ':tab help <args>', { nargs = 1, complete = "help" })
vim.api.nvim_create_user_command('Plugins',
  function ()
    local plugin_dir = vim.fn.stdpath("config").."/lua/plugins_c.lua"
    vim.cmd("edit "..plugin_dir)
  end,
  { nargs = 0 }
  )

vim.api.nvim_create_user_command('Todo',
  function ()
    vim.cmd(":silent vimgrep '\\(TODO:\\|FIXME:\\|BUG:\\)' **")
    vim.cmd("copen")
  end,
  { nargs = 0 }
  )

vim.api.nvim_create_user_command('Reload',
  function()
    vim.cmd('luafile $MYVIMRC') -- Source config
  end,
  { nargs = 0 }
  )

vim.api.nvim_create_user_command('Vimrc',
  function()
    vim.cmd('edit $MYVIMRC')
  end,
  { nargs = 0 }
  )

vim.api.nvim_create_user_command('Keymaps',
  function ()
    Keymap_dir = vim.fn.stdpath("config") .. "/lua/"
    vim.cmd("Ex "..Keymap_dir)
  end,
  { nargs = 0 }
  )

-- Save session to directory via custom Session command
Session_dir = vim.fn.stdpath("config") .. "/sessions/"

vim.api.nvim_create_user_command('Session',
  function(opts)
    vim.cmd("mksession! "..Session_dir..opts.fargs[1]..".vim")
    print('Session \"'..opts.fargs[1]..'.vim\" created in '..Session_dir)
  end,
  { nargs = 1 })

vim.api.nvim_create_user_command('Sessions',
  function ()
    vim.cmd("Ex "..Session_dir)
  end,
  { nargs = 0 })

-- -- Source the file under the cursor in Netrw
-- vim.api.nvim_create_user_command('Source',
--   function ()
--     local dir = vim.api.nvim_eval("@%")
--     local file = string.match(vim.api.nvim_eval("@\""), ".*%.vim")
--     local path = dir .. "/" .. file
--     vim.cmd("source "..path)
--   end,
--   { nargs = 0 }
--   )

-- -- Source the file under the cursor in Netrw
function Sourcefile()
  local dir = vim.api.nvim_eval("@%")
  local file = string.match(vim.api.nvim_eval("@\""), ".*%.vim")
  local path = dir .. "/" .. file
  vim.cmd("source "..path)
end

vim.api.nvim_set_keymap('n','<C-cr>', 'yy:lua Sourcefile()<cr>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n','<leader><cr>', 'yy:lua Sourcefile()<cr>', { noremap = true, silent = true })

vim.api.nvim_create_user_command('Snippets',
  function()
    vim.cmd("UltiSnipsEdit") -- UltiSnips
    -- vim.cmd("CocCommand snippets.editSnippets") -- CoC
  end,
  { nargs = 0 })

-- Preview markdown file while editing
vim.api.nvim_create_user_command('Mdpreview',
  function ()
    local grip_path = Shebang("which grip")
    print ("grip is at:", grip_path)
    if not vim.loop.fs_stat(grip_path) then
      print ("Grip not found! Install grip to continue.")
      return
    end
    vim.cmd("terminal grip -b %")
  end,
  { nargs = 0 })

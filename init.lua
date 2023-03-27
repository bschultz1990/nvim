-- https://bryankegley.me/posts/nvim-getting-started/
-- GENERAL
vim.opt.rtp:append("/usr/local/opt/fzf")
vim.scriptencoding = 'utf8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding= 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.pumheight = 10
vim.opt.pumblend = 0
vim.opt.cursorline = true
-- vim.opt.inccommand = 'split'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldenable = true
-- vim.opt.termguicolors = true
vim.opt.ruler = false
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.cmdheight = 1
vim.opt.shortmess = 'F'
vim.opt.wrap.linebreak = false
vim.opt.whichwrap = '<,>,h,l'
vim.opt.linebreak = false
vim.opt.ignorecase = true
vim.opt.winblend = 15

-- Center cursor line on the screen.
vim.opt.scrolloff = 5
vim.opt.wrap = false

-- TAKUYA TABS:
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
-- vim.opt.shiftwidth = 2
vim.opt.autoindent = true
-- vim.opt.smartindent = true

function Shebang(cmd)
  local env = io.popen(cmd):read("*a") -- read the output of "which python3"
  env = string.sub(env, 1, -2) -- cut out the newline character
  io.close() -- close the file handle
  return env
end
vim.g.python3_host_prog = Shebang("which python3")
vim.g.loaded_perl_provider = 0

---- NETRW
vim.g.netrw_keepdir = 1
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_liststyle = 1

----------CUSTOM COMMANDS----------

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
    vim.cmd(":vimgrep '\\(TODO\\|FIXME\\|BUG\\)' **")
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

-- Source the file under the cursor in Netrw
function Sourcefile()
  local dir = vim.api.nvim_eval("@%")
  local file = string.match(vim.api.nvim_eval("@\""), ".*%.vim")
  local path = dir .. "/" .. file
  vim.cmd("source "..path)
end

-- vim.api.nvim_set_keymap('n','<C-cr>', 'yy:lua Sourcefile()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader><cr>', 'yy:lua Sourcefile()<cr>', { noremap = true, silent = true })

vim.api.nvim_create_user_command('Snippets',
  function()
    vim.cmd("UltiSnipsEdit") -- UltiSnips
    -- vim.cmd("CocCommand snippets.editSnippets") -- CoC
  end,
  { nargs = 0 })

vim.api.nvim_create_user_command('Mdpreview',
  function ()
    local grip_path = "/usr/bin/grip"
    -- print (grip_path)
    if not vim.loop.fs_stat(grip_path) then
      print ("Grip not found! Install grip to continue.")
      return
    end
    vim.cmd("terminal grip -b %")
  end,
  { nargs = 0 })

-- KEYMAPS
vim.g.mapleader = ','

vim.api.nvim_set_keymap('n','<leader>ex', ':Explore<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>H', ':lua vim.cmd("tab h " .. vim.fn.expand("<cword>"))<cr>', { noremap = true })
-- Do not yank with x
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true, nowait = true })

-- Increment, decrement
vim.api.nvim_set_keymap('n', '+', '<C-a>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '-', '<C-x>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n','<leader>q',':q<cr>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n','<F3>',':wa<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<F5>',':luafile $MYVIMRC<cr>', { noremap = true, silent = true })

-- Indents
vim.api.nvim_set_keymap('n', '<leader><Tab>', 'magg=G`azz', { noremap = true, silent = true }) -- indent on command and center the cursor

-- Center Search Results on the Page
vim.api.nvim_set_keymap('n','n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','N', 'Nzzzv', { noremap = true, silent = true })

-- Center bottom of document on page.
vim.api.nvim_set_keymap('n','G', 'Gzz', { noremap = true, silent = true })

-- FOLDS AND SUCH
vim.api.nvim_set_keymap('n','<leader>fd', ':set foldlevel=1<cr><cmd>echo "Folding..."<cr>', { noremap = true, silent = true }) -- Fold
vim.api.nvim_set_keymap('n','<leader>uf', ':set foldlevel=99<cr><cmd> echo "Unfolding..."<cr>', { noremap = true, silent = true }) -- Unfold

-- BUFFERS AND SPLITS
vim.api.nvim_set_keymap('n','<leader>n', ':bn<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>vs',':vs<cr><C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>sp',':sp<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>w','<C-w>w<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>c','<C-w><C-c><cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tt',':tabnew<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tn',':tabnext<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>`','<cmd>sp<cr><C-w>w<cmd>terminal<cr>i', { noremap = true, silent = true })

-- INSERT MODE GOODIES
vim.api.nvim_set_keymap('i','<C-Cr>','<CR><CR><Up><BS><CR>', { noremap = true, silent = true })

-- PLUGINS
require('plugins_c')

-- Colorschemes
vim.cmd('colorscheme '..
  -- 'NeoSolarized'
  -- 'catppuccin'
  -- 'github_dark'
  -- 'github_light'
  -- 'moonlight'
  'night-owl'
  -- 'sonokai'
  -- 'tokyodark'
  -- 'tokyonight'
  )
-- For more options, :Telescope colorscheme

-- PLUGIN SPECIFIC KEYMAPS
vim.api.nvim_set_keymap('n','<F6>', ':Lazy<cr>', { noremap = true, silent = true }) -- Lazy
vim.api.nvim_set_keymap('n','<leader>zz',':ZenMode<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x','ga','<Plug>(EasyAlign)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n','<leader>tr','<cmd>TroubleToggle<cr>', { noremap = false, silent = true })

require('configs.test')

-- SUCCESS! :)
print(' init.lua loaded! :)')

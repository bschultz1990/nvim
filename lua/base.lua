-- https://bryankegley.me/posts/nvim-getting-started/
-- GENERAL
vim.opt.rtp:append("/usr/local/opt/fzf")
vim.scriptencoding = 'utf8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.pumheight = 5
vim.opt.pumblend = 0
vim.opt.cursorline = true
-- vim.opt.inccommand = 'split'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.termguicolors = true
vim.opt.ruler = false
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.cmdheight = 1
vim.opt.shortmess = 'F'
vim.opt.wrap.linebreak = true
vim.opt.whichwrap = '<,>,h,l'
vim.opt.linebreak = false
vim.opt.ignorecase = true
vim.opt.winblend = 15
vim.opt.signcolumn = 'yes:1'
vim.opt.scrolloff = 5
vim.opt.wrap = false

-- TAKUYA TABS:
vim.opt.expandtab = false  -- use spaces to mimic tabs
vim.opt.smarttab = false   -- insert blanks in new line
vim.opt.tabstop = 2        -- number of spaces for a tabstop
vim.opt.shiftwidth = 0     -- use tabstop value
vim.opt.autoindent = true  -- copy current line indent below
vim.opt.smartindent = true -- smart indenting on new lines. works well with autoindent
vim.opt.shiftround = true  -- round to multiples of tabstop

-- Python provider bonanza
vim.g.python3_host_prog = Shebang("which python3")
vim.g.loaded_perl_provider = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_liststyle = 1

vim.opt.listchars = { space = '_', tab = '>~' }

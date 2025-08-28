vim.o.cursorlineopt = "both" -- enable cursorline
vim.o.signcolumn = "no" -- No left margin
vim.o.foldlevel = 99
vim.o.wrap = false
vim.o.laststatus = 3
vim.o.showmode = false
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.confirm = true
vim.opt.termguicolors = true

vim.o.winborder = "single"
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true
})

vim.o.list = true -- Show invisible characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- Show invisible characters 
vim.opt.fillchars = { eob = " " } -- No margin squiggles on blank lines

-- Clipboard and Text Manipulation
vim.o.clipboard = ""

-- PowerShell as default on Windows
if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.o.shell = "powershell.exe"
end

vim.opt.shortmess:append "sI" -- disable nvim intro


-- Indenting
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2

-- Numbers
vim.o.number = true
vim.o.ruler = false
vim.o.numberwidth = 2

vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.timeoutlen = 400
vim.o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
vim.o.updatetime = 1000

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"


-- disable some default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0


-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH


-- vim.g.markdown_fenced_languages = {
  --   "vim",
  --   "lua",
  --   "html",
  --   "css",
  --   "python",
  --   "ps1"
  -- }

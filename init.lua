-- GENERAL
vim.opt.clipboard = {"unnamedplus"}
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.pumheight = 3
vim.opt.pumblend = 12
vim.opt.cursorline = true
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ruler = false
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.cmdheight = 1
vim.opt.shortmess ="F"
vim.opt.wrap.linebreak = true
vim.opt.whichwrap = "<,>,h,l"
vim.opt.expandtab = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.winblend = 20

---- NETRW
vim.g.netrw_keepdir = 1
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_liststyle = 0

-- NEOVIDE
if (vim.g.neovide) then
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_scroll_animation_length = 0.3
  vim.opt.guifont = "FiraCode NF:h10"
  -- vim.g.neovide_fullscreen = "v:true"
end

-- PLUGINS
-- https://www.notonlycode.org/neovim-lua-config/
-- https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
local Plug = vim.fn["plug#"]
vim.call("plug#begin", vim.fn.stdpath('data').."/plugins")

---- COLOR SCHEMES
Plug 'sainnhe/sonokai'

---- DEV
Plug 'tpope/vim-commentary'
Plug 'KabbAmine/vCoolor.vim'
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'williamboman/mason.nvim'
Plug 'bschultz1990/cheatsheet.nvim'

---- LUALINE
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

---- TELESCOPE
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'


vim.call("plug#end")

-- default, atlantis, andromeda, shusia, maia, espresso
vim.g.sonokai_style = 'atlantis'
vim.cmd("colorscheme sonokai")


-- KEYMAPS
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

function xxmap(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = false, silent = true })
end

function xmap(shortcut, command)
  xxmap('x', shortcut, command)
end

vim.g.mapleader = ','


nmap('<F3>', ':wa<cr>')
nmap('<F5>', ':luafile $MYVIMRC<cr>')
nmap("<F6>", ':PlugInstall<cr>')
nmap("<F7>", ':PlugClean<cr>')
nmap("<F12>",":edit $MYVIMRC<cr>")

-- BUFFERS AND SPLITS
nmap("<leader>n", ":bn<cr>")
nmap("<leader>vs",":vs<cr>")
imap("<leader>vs",":vs<cr><C-w>w")
nmap("<leader>sp",":sp<cr><C-w>w")

-- INSERT MODE GOODIES
imap("<C-cr>","<CR><CR><Up><BS><CR>")

-- PLUGIN SPECIFIC
nmap("<leader>st",":Startify<cr>")
nmap("<leader>zz",":ZenMode<cr>")
xmap("ga","<Plug>(EasyAlign)")


-- EXTERNAL REQUIREMENTS
require ('config_lualine')

-- SUCCESS! :)
print('init.lua loaded! :)')

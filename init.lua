-- print('init.lua loaded!:)')
print ("vim.g.neovide: ",vim.g.neovide)

-- GENERAL
vim.opt.clipboard:append = {"unnamedplus"}
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


-- NEOVIDE
if (vim.g.neovide == true) then
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_scroll_animation_length = 0.3
  vim.opt.guifont = "Oxygen Mono:h11"
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

vim.call("plug#end")

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

vim.g.mapleader = ','

nmap('<F3>', '<cmd>wa<cr>')
nmap('<F5>', '<cmd>luafile $MYVIMRC<cr>')
nmap("<F6>", '<cmd>PlugInstall<cr>')
nmap("<F7>", '<cmd>PlugClean<cr>')


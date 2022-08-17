-- GENERAL
vim.scriptencoding = 'utf8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.clipboard = {"unnamedplus"}
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.pumheight = 3
vim.opt.pumblend = 0
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
vim.opt.winblend = 10

---- NETRW
vim.g.netrw_keepdir = 1
vim.g.netrw_localcopydircmd = 'cp -r'
vim.g.netrw_liststyle = 0

-- NEOVIDE
if (vim.g.neovide) then
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_scroll_animation_length = 0.3
  vim.opt.guifont = "FiraCode NF:h11"
  -- set guifont=*  <== lists all fonts
  vim.g.neovide_fullscreen = false
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
Plug 'bschultz1990/cheatsheet.nvim'

---- LUALINE
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

---- TELESCOPE
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

---- NVIM-LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
-- Plug 'glepnir/lspsaga.nvim'

vim.call("plug#end")

-- default, atlantis, andromeda, shusia, maia, espresso
vim.g.sonokai_style = 'shusia'
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
nmap("<leader>vs",":vs<cr><C-w>w:Ex<cr>")
nmap("<leader>sp",":sp<cr>:Ex<cr>")
nmap("<leader>bd",":bd!<cr>")
nmap("<leader>tt",":tabnew<cr>")
nmap("<leader>tc",":tabclose<cr>")
nmap("<leader>tn",":tabnext<cr>")

-- INSERT MODE GOODIES
imap("<C-cr>","<CR><CR><Up><BS><CR>")

-- PLUGIN SPECIFIC
nmap("<leader>st",":Startify<cr>")
nmap("<leader>zz",":ZenMode<cr>")
xmap("ga","<Plug>(EasyAlign)")
nmap("<leader>td",":Telescope diagnostics<cr>")


-- EXTERNAL REQUIREMENTS
require ('cfg_telescope')
require ('cfg_lualine')
require ('cfg_nvim-cmp')
-- require ('cfg_nvim-lspconfig')

-- SUCCESS! :)
print(' init.lua loaded! :)')

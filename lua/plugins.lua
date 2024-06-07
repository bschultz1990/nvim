vim.cmd([[
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'windwp/nvim-autopairs'
Plug 'sainnhe/sonokai'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'elihunter173/dirbuf.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

nnoremap ga = <Plug>(EasyAlign)
]])

-- Plenary setup:
local async = require "plenary.async"


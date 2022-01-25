set number
set showmatch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set ttyfast
syntax on
set mouse=a
set cursorline
set nowrap
set termguicolors

autocmd VimEnter * PlugInstall

source ~/.config/nvim/keymap.vim
source ~/.config/nvim/which-key.vim

call plug#begin('~/.config/nvim/autoload/')
    Plug 'liuchengxu/vim-which-key' " WhichKey popup
    Plug 'chun-yang/auto-pairs' " Auto brackets, parens, quotes, etc
    Plug 'sheerun/vim-polyglot' " Syntax highlighting
    Plug 'phanviet/vim-monokai-pro' " Monokai Pro Theme
    Plug 'vim-airline/vim-airline' " vim-airline bottom status bar
    Plug 'kyazdani42/nvim-web-devicons' " dev icons for telescope
    "    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'elihunter173/dirbuf.nvim' " Directory buffer - edit files like text.
    Plug 'neovim/nvim-lspconfig' " Neovim 
    Plug 'junegunn/fzf'
call plug#end()

colorscheme monokai_pro
set laststatus=2 " Enable airline 
set noshowmode " Omit normal status bar because we have Airline now. :)

" :PlugInstall
" :PlugUpdate
" :PlugClean




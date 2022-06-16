call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
	"	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'romgrk/barbar.nvim'	
	Plug 'sheerun/vim-polyglot'
	Plug 'phanviet/vim-monokai-pro'
	Plug 'pangloss/vim-javascript'
	Plug 'https://github.com/ap/vim-css-color'
	Plug 'folke/zen-mode.nvim' " ZenMode
	Plug 'folke/twilight.nvim' " Twilight
	Plug 'KabbAmine/vCoolor.vim' " Alt+C
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" lightline or powerline
	" live server
	" telescope
	" tmux sessions
	" nerdtree or chadtree
call plug#end()


set termguicolors
"set cindent
set smartindent
colorscheme monokai_pro
set mouse=a

set number

" CUSTOM KEYBINDS
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" COC Info
" :CocInstall coc-emmet
" <C-n> and <C-p> to choose a completion option
" <C-y> to paste a picked completion
:PlugInstall

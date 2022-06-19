" *****pLace this file here: ~/.config/nvim/init.vim*****
	" WHERE YOU LEFT OFF https://github.com/romkatv/powerlevel10k

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
	Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'romgrk/barbar.nvim'	
	Plug 'sheerun/vim-polyglot'
	Plug 'phanviet/vim-monokai-pro'
	Plug 'pangloss/vim-javascript'
	Plug 'https://github.com/ap/vim-css-color'
	Plug 'folke/zen-mode.nvim' " ZenMode
	Plug 'folke/twilight.nvim' " Twilight
	Plug 'KabbAmine/vCoolor.vim' " Alt+C
"	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'fladson/vim-kitty' " Kitty config syntax highlighting
	" Telescope
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	" lightline or powerline
	" live server
	" tmux sessions
call plug#end()


set termguicolors
"set cindent
set smartindent
colorscheme monokai_pro
set mouse=a

set number
set relativenumber

" Custom Commands


" Custom Keybinds. Leader is \
nnoremap <leader>c <cmd>CHADopen<cr>
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

:PlugInstall

lua << EOF
require('telescope').setup{
pickers = {
  find_files = {
    find_command = {
        "fzf",
        ".",
        "--type",
        "file",
        "--hidden",
        "--strip-cwd-prefix"
    }
  }
}
}
EOF

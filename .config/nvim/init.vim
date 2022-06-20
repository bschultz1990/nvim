" *****Place this file here: ~/.config/nvim/init.vim*****
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
	Plug 'fladson/vim-kitty' " Kitty config syntax highlighting
	Plug 'sindrets/diffview.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }	" Telescope stuff
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'itchyny/lightline.vim'
	Plug 'mhinz/vim-startify'
	" live server
	" tmux sessions
	"
call plug#end()

lua << EOF
require("telescope").setup {
  defaults = {
  },
  pickers = {
    find_files = {
      find_command = {"fdfind"},
			hidden = {true}
    },
  }
}
EOF


" Custom Keybinds. Default leader is \
let mapleader = ','
nnoremap <leader>c <cmd>CHADopen<cr>
nnoremap <leader>, <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
"nnoremap <leader>w <cmd>bd<cr>
nnoremap <leader>w <cmd>tabclose<cr>
nnoremap <leader>zz <cmd>ZenMode<cr>
nnoremap <leader>diff <cmd>DiffviewOpen<cr>

" Normal mode
nnoremap <C-Up> :m .-2<cr>==
nnoremap <C-Down> :m .+1<cr>==" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

"" STARTIFY
   "" Most used options:~
     "g:startify_bookmarks
     "g:startify_change_to_dir
     "g:startify_change_to_vcs_root
     "g:startify_change_cmd
     "g:startify_custom_header
     "g:startify_enable_special
		let g:startify_session_persistence = 1
		let g:startify_session_dir='~/.config/nvim/startify_sessions'

let g:startify_lists = [
\ { 'type': 'sessions',  'header': ['   Sessions']       },
					\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
					\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
					\ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

     "g:startify_list_order

     "g:startify_skiplist
     "g:startify_update_oldfiles
 
    "Misc options:~
"    |g:startify_commands|
"    |g:startify_custom_footer|
"    |g:startify_custom_header_quotes|
"    |g:startify_custom_indices|
"    |g:startify_disable_at_vimenter|
"    |g:startify_enable_unsafe|
"    |g:startify_files_number|
"    |g:startify_fortune_use_unicode|
"    |g:startify_padding_left|
"    |g:startify_relative_path|
"    |g:startify_skiplist_server|
"    |g:startify_use_env|

    ""Sessions

					
"    |g:startify_session_autoload|
"    |g:startify_session_before_save|
"    |g:startify_session_delete_buffers|
"    |g:startify_session_number|
"    |g:startify_session_remove_lines|
"    |g:startify_session_savecmds|
"    |g:startify_session_savevars|
"    |g:startify_session_sort|

set termguicolors
"set cindent
set smartindent
colorscheme monokai_pro
set mouse=a
set number
set relativenumber
"Remove redundant stuff now that we have Lightline
set noshowmode
set noshowcmd
set shortmess+=F
set noruler
set cmdheight=0
"set laststatus=3 "Global status line at bottom


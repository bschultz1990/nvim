" *****Place this file here: ~/.config/nvim/init.vim*****
" WHERE YOU LEFT OFF https://github.com/romkatv/powerlevel10k

" --------------------------------------	
" 								GENERAL
" --------------------------------------								|
" NETRW
let g:netrw_keepdir=0																		"Keep current dir and browsing dir synced.
let g:netrw_winsize=15																	"window split
let g:netrw_localcopydircmd = 'cp -r'										"Recursively copy directories
hi link netrwMarkFile Search														
let g:netrw_liststyle=0																	"0, 1 per line, 1 long w/ size, 2 wide, 3 tree

set termguicolors
"set cindent
set smartindent
set mouse=a
set number
set relativenumber
"Remove redundant stuff now that we have Lightline
set noruler
set noshowmode
set noshowcmd
"set cmdheight=0
set shortmess=F

" --------------------------------------	
" 								PLUGINS
" --------------------------------------								|
" /home/bens/.local/share/nvim/plugged
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'	
Plug 'sheerun/vim-polyglot'
Plug 'phanviet/vim-monokai-pro'
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/ap/vim-css-color'
Plug 'folke/zen-mode.nvim'																" ZenMode
Plug 'folke/twilight.nvim'																" Twilight
Plug 'KabbAmine/vCoolor.vim'															" Alt+C color picker
Plug 'fladson/vim-kitty'																	" Kitty config syntax highlighting
Plug 'sindrets/diffview.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-easy-align'
"Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'bschultz1990/cheatsheet.nvim'
call plug#end()

colorscheme monokai_pro


" --------------------------------------
" 								TELESCOPE
" --------------------------------------								|
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

" --------------------------------------
" 								KEYBINDS
" --------------------------------------								|

let mapleader = ','																			"Change leader. Default is \
nnoremap <leader>c <cmd>Lexplore<cr>										"Toggle netrw
nnoremap <C-e>=G
nnoremap <leader>, <cmd>Telescope<cr>
nnoremap <leader>bd<cmd>bd<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
"nnoremap <leader>w <cmd>bd<cr>
nnoremap <leader>w <cmd>tabclose<cr>
nnoremap <leader>zz <cmd>ZenMode<cr>
nnoremap <leader>diff <cmd>DiffviewOpen<cr>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Normal mode
nnoremap <C-Up> :m .-2<cr>==
nnoremap <C-Down> :m .+1<cr>==" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" --------------------------------------
" 								STARTIFY                                                                            │    netrw-mm    Move marked files to target                                                                                  11 - twilight.nvim: Already installed     
" --------------------------------------								|
let g:startify_session_persistence = 1
let g:startify_session_dir='~/.config/nvim/startify_sessions'

let g:startify_lists = [
			\ { 'type': 'sessions',  'header': ['   Sessions']       },
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
			\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
			\ { 'type': 'files',     'header': ['   MRU']            },
			\ { 'type': 'commands',  'header': ['   Commands']       },
			\ ]
"g:startify_bookmarks
"g:startify_change_to_dir
"g:startify_change_to_vcs_root
"g:startify_change_cmd
"g:startify_custom_header
"g:startify_enable_special
"g:startify_list_order
"g:startify_skiplist
"g:startify_update_oldfiles

"MISC OPTIONS
"g:startify_commands|
"g:startify_custom_footer|
"g:startify_custom_header_quotes|
"g:startify_custom_indices|                                                                            │    netrw-mm    Move marked files to target                                                                                  11 - twilight.nvim: Already installed     
"g:startify_disable_at_vimenter|
"g:startify_enable_unsafe|
"g:startify_files_number|
"g:startify_fortune_use_unicode|
"g:startify_padding_left|
"g:startify_relative_path|
"g:startify_skiplist_server|
"g:startify_use_env|


"SESSIONS 				
"g:startify_session_autoload
"g:startify_session_before_save
"g:startify_session_delete_buffers
"g:startify_session_number
"g:startify_session_remove_lines
"g:startify_session_savecmds
"g:startify_session_savevars
"g:startify_session_sort

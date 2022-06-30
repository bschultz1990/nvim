"----------------SOURCES---------------
" *****Place this file here: ~/.config/nvim/init.vim
source $HOME/.config/nvim/plugin-configs/startify.vim

"----------------GENERAL---------------{{{
" NETRW
let g:netrw_keepdir=1																		"Keep current dir and browsing dir synced.
let g:netrw_winsize=15																	"window split
let g:netrw_localcopydircmd = 'cp -r'										"Recursively copy directories
hi link netrwMarkFile Search
let g:netrw_liststyle=0																	"0, 1 per line, 1 long w/ size, 2 wide, 3 tree

set foldcolumn=2 
set foldmethod=marker
set termguicolors
"set cindent
set autoindent
set smartindent
set mouse=a
set number
set relativenumber
set noruler
set noshowmode
set noshowcmd
set cmdheight=1
set shortmess=F
set clipboard+=unnamedplus
set wildmenu
"}}}

"----------------PLUGINS---------------{{{
" /home/bens/.local/share/nvim/plugged
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'lewis6991/gitsigns.nvim'
Plug 'feline-nvim/feline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'phanviet/vim-monokai-pro'
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/ap/vim-css-color'
Plug 'folke/zen-mode.nvim'																" ZenMode
Plug 'folke/twilight.nvim'																" Twilight
Plug 'KabbAmine/vCoolor.vim'															" Alt+C color picker
Plug 'fladson/vim-kitty'																	" Kitty config syntax highlighting
Plug 'sindrets/diffview.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-easy-align'
"Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'bschultz1990/cheatsheet.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'romgrk/barbar.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'neoclide/coc-snippets'
call plug#end()
colorscheme monokai_pro
" let g:tokyonight_style = 
" colorscheme tokyonight
"}}}

"----------------KEYBINDS---------------{{{
let mapleader = ','                                                                 "|Change leader. Default is \

" NORMAL MODE
""Move Line Down Or up like VSCode
nnoremap <silent>C-Down> :m .+1<cr>
vnoremap <silent>C-Down> :m .+1<cr>
nnoremap <silent>C-Up> :m .-2<cr>
vnoremap <silent><C-Up> :m .-2<cr>
nnoremap <silent><leader>c <cmd> Lexplore<cr>
nnoremap <leader>, <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <silent><leader>bd <cmd>bd<cr>
nnoremap <silent><leader>w <cmd>bd<cr>
" nnoremap <leader>w <cmd>tabclose<cr>
nnoremap <leader>zz <cmd>ZenMode<cr>
nnoremap <leader>diff <cmd>DiffviewOpen<cr>
xmap ga <Plug>(EasyAlign)
map ga <Plug>(EasyAlign)
nnoremap <silent><nowait> <leader>k :call CocAction('jumpDefinition', v:false)<CR>
" nnoremap <silent><nowait> <leader>k <cmd>PreviewDefinition<CR>
nnoremap <silent><C-`> :ToggleTerm<cr>
nnoremap <silent><C-/> :Commentary<cr>
vnoremap <silent><C-/> :Commentary<cr>

""TODO: INSERT MODE
"inoremap <C-BS> <cmd>dw<cr>
"}}}

"----------------SNIPPETS---------------{{{
"READ command:
"nnoremap ,html <cmd>-1read path/to/file.extension(cursor movement nonsense here)
nnoremap <leader>html <cmd>-1read $HOME/.config/nvim/user-snippets/boilerplate.html<CR>12Gi
"}}}

"----------------LUA CONFIG---------------{{{
lua << EOF

require("toggleterm").setup{}
require('feline').setup()
require('gitsigns').setup{
signcolumn = false,
}
require("telescope").setup {
	defaults = {
		},
	pickers = {
		find_files = {
			find_command = {"fdfind"},
			hidden = {true},
      search_dirs = {"~/"}
			},
		}
	}
EOF
"}}}

"----------------CUSTOM FUNCTIONS---------------{{{


" --------------------------------------

"COC - USE TAB FOR COMPLETION
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


"}}}

"mklink /j "Link" "Source Target"
let g:python3_host_prog="python3"
let g:loaded_perl_provider = 0 
" let g:netrw_keepdir=1			"Keep current dir and browsing dir synced.
let g:netrw_winsize=15			"window split
let g:netrw_localcopydircmd = 'cp -r'	"Recursively copy directories
hi link netrwMarkFile Search
let g:netrw_liststyle=0			"0, 1 per line, 1 long w/ size, 2 wide, 3 treenetrw
set clipboard+=unnamedplus
set pumheight=3
set pumblend=12
set cursorline
" set foldcolumn=2 
" set foldmethod=manual
setlocal foldmethod=indent
set nofoldenable
set foldlevel=99
set termguicolors
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
set wrap linebreak
set whichwrap+=<,>,h,l
set ignorecase
" set tabstop=2
set shiftwidth=2
set softtabstop=2


"----------------NEOVIDE---------------
if exists("g:neovide")
  let g:neovide_fullscreen=v:false
  let g:neovide_cursor_animation_length=0.04
  let g:neovide_scroll_animation_length=0.3
endif

"----------------PLUGINS---------------
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"----------------COLOR SCHEMES---------------
Plug 'sainnhe/sonokai'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'phanviet/vim-monokai-pro'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim'
Plug 'kjssad/quantum.vim'
Plug 'NLKNguyen/papercolor-theme'

"----------------BOTTOM BAR---------------
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'

"----------------OTHER---------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets'
Plug 'lewis6991/gitsigns.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'KabbAmine/vCoolor.vim'
Plug 'folke/zen-mode.nvim'
Plug 'folke/twilight.nvim'
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
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/matchit'
call plug#end()

colorscheme sonokai

"----------------KEYMAPS----------------
let mapleader = ','

" --- GENERAL ---
nnoremap <silent><C-Down> :m .+1<cr>
vnoremap <silent><C-Down> :m .+1<cr>
nnoremap <silent><C-Up> :m .-2<cr>
vnoremap <silent><C-Up> :m .-2<cr>
nnoremap <leader><C-,> <cmd>edit $MYVIMRC<cr>
nnoremap <nowait> <leader>c <cmd>Explore<cr>
nnoremap <silent><leader>bd <cmd>bd<cr>
nnoremap <silent><leader>bd! <cmd>bd!<cr>
nnoremap <silent><leader>n :bn<cr>
nnoremap <leader>vs <cmd>vs<cr>
inoremap <leader>vs <cmd>vs<cr><C-w>w
nnoremap <leader>sp <cmd>sp<cr><C-w>w
" nnoremap <leader>w <cmd>tabclose<cr>
nnoremap <silent><F3> <cmd>wa<cr>
inoremap <silent><F3> <C-o><cmd>wa<cr>
nnoremap <C-CR> i<CR><CR><Up><BS>
inoremap <C-CR> <CR><CR><Up><BS><CR>
nnoremap <F5> <cmd>source $MYVIMRC<cr>

" PLUGIN-BASED
nnoremap <leader>zz <cmd>ZenMode<cr>

nnoremap <leader>, <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>

nnoremap <silent><leader>st :Startify<cr>

nnoremap <silent><leader>ls :terminal<cr>ilive-server<cr>

xmap ga <Plug>(EasyAlign)
map ga <Plug>(EasyAlign)

nnoremap <silent><nowait> <leader>k :call CocAction('jumpDefinition', v:false)<CR>

nnoremap <silent><C-`> :ToggleTerm<cr>

nnoremap <silent><C-/> :Commentary<cr>
vnoremap <silent><C-/> :Commentary<cr>

"----------------SOURCES----------------
luafile $HOME/AppData/Local/nvim/config.lua

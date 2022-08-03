"----------------GENERAL---------------{{{
"
" NETRW
let g:python3_host_prog="python3"
let g:loaded_perl_provider = 0 
" let g:netrw_keepdir=1																		"Keep current dir and browsing dir synced.
let g:netrw_winsize=15																	"window split
let g:netrw_localcopydircmd = 'cp -r'										"Recursively copy directories
hi link netrwMarkFile Search
let g:netrw_liststyle=0																	"0, 1 per line, 1 long w/ size, 2 wide, 3 treenetrw

set pumheight=5
set pumblend=25
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
"}}}

"----------------PLUGINS---------------{{{
" /home/bens/.local/share/nvim/plugged
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

  "----------------COLOR SCHEMES---------------
  Plug 'sainnhe/sonokai'
  " Plug 'phanviet/vim-monokai-pro'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'EdenEast/nightfox.nvim'
  Plug 'kjssad/quantum.vim'
  Plug 'NLKNguyen/papercolor-theme'


"----------------BOTTOM BAR---------------
" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets'
Plug 'lewis6991/gitsigns.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'KabbAmine/vCoolor.vim'															" Alt+C color picker
Plug 'folke/zen-mode.nvim'																" ZenMode
Plug 'folke/twilight.nvim'																" Twilight
Plug 'fladson/vim-kitty'																	" Kitty config syntax highlighting
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
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
Plug 'preservim/vim-colors-pencil'
Plug 'tmhedberg/matchit'
call plug#end()

let g:onedark_config = {'style': 'warm'}
" sonokai_style options: default, atlantis, andromeda, shusia, maia, espresso
let g:sonokai_style = 'maia'
        let g:sonokai_better_performance = 1

" nightfox, dayfox, dawnfox, duskfox, nordfox, terafox
" PaperColor, sonokai
" set background=light
colorscheme sonokai
"}}}

"----------------KEYMAPS---------------{{{
let mapleader = ','                       "|Change leader. Default is \

"Move Line Down Or up like VSCode
nnoremap <silent><C-Down> :m .+1<cr>
vnoremap <silent><C-Down> :m .+1<cr>
nnoremap <silent><C-Up> :m .-2<cr>
vnoremap <silent><C-Up> :m .-2<cr>
nnoremap <silent><leader><C-,> <cmd> edit $MYVIMRC<cr>
nnoremap <nowait> <leader>c <cmd>Explore<cr>
nnoremap <silent><leader>st :Startify<cr>
nnoremap <silent><leader>ls :terminal<cr>ilive-server<cr>
nnoremap <leader>, <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <silent><leader>bd <cmd>bd<cr>
nnoremap <silent><leader>bd! <cmd>bd!<cr>
nnoremap <silent><leader>n :bn<cr>
nnoremap <leader>vs <cmd>vs<cr>
inoremap <leader>vs <cmd>vs<cr><C-w>w
nnoremap <leader>sp <cmd>sp<cr><C-w>w
" nnoremap <leader>w <cmd>tabclose<cr>
nnoremap <leader>zz <cmd>ZenMode<cr>
xmap ga <Plug>(EasyAlign)
map ga <Plug>(EasyAlign)
nnoremap <silent><nowait> <leader>k :call CocAction('jumpDefinition', v:false)<CR>
nnoremap <silent><C-`> :ToggleTerm<cr>
nnoremap <silent><C-/> :Commentary<cr>
vnoremap <silent><C-/> :Commentary<cr>

nnoremap <silent><leader>cs <cmd>noh<cr>
nnoremap <F5> <cmd>source ~/.config/nvim/init.vim<cr>
nnoremap <C-CR> i<CR><CR><Up><BS>
inoremap <C-CR> <CR><CR><Up><BS><CR>

nnoremap <silent><F3> <cmd>wa<cr>
inoremap <silent><F3> <C-o><cmd>wa<cr>
""TODO: INSERT MODE
" inoremap <C-BS> <C-o><cmd>dw<cr>
"}}}

"----------------SNIPPETS---------------{{{
"READ command:
"nnoremap ,html <cmd>-1read path/to/file.extension<cr>(cursor movement nonsense here)
nnoremap <leader>html <cmd>-1read $HOME/.config/nvim/user-snippets/boilerplate.html<CR>12Gi
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

"----------------SOURCES---------------{{{
" *****Place this file here: ~/.config/nvim/init.vim
source $HOME/.config/nvim/plugin-configs/startify.vim
luafile $HOME/.config/nvim/config.lua

"}}}


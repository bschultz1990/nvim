"----------------GENERAL---------------{{{
" NETRW
let g:python3_host_prog="python3"
let g:loaded_perl_provider = 0 
let g:netrw_keepdir=1																		"Keep current dir and browsing dir synced.
let g:netrw_winsize=15																	"window split
let g:netrw_localcopydircmd = 'cp -r'										"Recursively copy directories
hi link netrwMarkFile Search
let g:netrw_liststyle=0																	"0, 1 per line, 1 long w/ size, 2 wide, 3 treenetrw

set pumheight=2
set pumblend=25
set cursorline
" set foldcolumn=2 
set foldmethod=marker
set termguicolors
set autoindent
set smartindent
set mouse=a
set number
" set relativenumber
set noruler
set noshowmode
set noshowcmd
set cmdheight=1
set shortmess=F
set clipboard+=unnamedplus
set wrap linebreak
set whichwrap+=<,>,h,l
"}}}

"----------------PLUGINS---------------{{{
" /home/bens/.local/share/nvim/plugged
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

"----------------COLOR SCHEMES---------------{{{
Plug 'sainnhe/sonokai'
" Plug 'phanviet/vim-monokai-pro'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'navarasu/onedark.nvim'"}}}

"----------------BOTTOM BAR---------------{{{
Plug 'itchyny/lightline.vim'
" Plug 'feline-nvim/feline.nvim'"}}}

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
call plug#end()

" colorscheme onedark
" let g:onedark_config = {'style': 'warm'}
" colorscheme monokai_pro
" let g:tokyonight_style = 
" colorscheme tokyonight

let g:sonokai_style = 'default'
        let g:sonokai_better_performance = 1
        colorscheme sonokai

"}}}

"----------------KEYMAPS---------------{{{
let mapleader = ','                                                                 "|Change leader. Default is \

" NORMAL MODE
""Move Line Down Or up like VSCode
nnoremap <silent><C-Down> :m .+1<cr>
vnoremap <silent><C-Down> :m .+1<cr>
nnoremap <silent><C-Up> :m .-2<cr>
vnoremap <silent><C-Up> :m .-2<cr>
nnoremap <silent><leader>c <cmd> Lexplore<cr>
nnoremap <leader>, <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <silent><leader>bd <cmd>bd<cr>
nnoremap <leader>n <cmd>bn<cr>
vnoremap <leader>n <cmd><cr>
nnoremap <leader>vs <cmd>vs<cr><C-w>w
inoremap <leader>vs <cmd>vs<cr><C-w>w
nnoremap <leader>sp <cmd>sp<cr><C-w>w
inoremap <leader>sp <cmd>sp<cr><C-w>w
" nnoremap <leader>w <cmd>tabclose<cr>
nnoremap <leader>zz <cmd>ZenMode<cr>
nnoremap <leader>diff <cmd>DiffviewOpen<cr>
xmap ga <Plug>(EasyAlign)
map ga <Plug>(EasyAlign)
nnoremap <silent><nowait> <leader>k :call CocAction('jumpDefinition', v:false)<CR>
nnoremap <silent><C-`> :ToggleTerm<cr>
nnoremap <silent><C-/> :Commentary<cr>
vnoremap <silent><C-/> :Commentary<cr>


inoremap <silent><F3> <C-o><cmd>w<cr>
" inoremap <ESC> <C-o>:call PopupCheck()<CR>
" Map ESC to menu exit 
function! PopupCheck() abort
  if pumvisible()
    inoremap <silent><ESC> <C-y>
    nnoremap <silent><ESC> <C-y>
    echomsg "Closed menu!"
  else
    inoremap <silent><ESC> <ESC>
    nnoremap <silent><ESC> <ESC>
    echomsg "Nothing changed"
  endif
endfunction


""TODO: INSERT MODE
" inoremap <C-BS> <C-o><cmd>dw<cr>
"}}}

"----------------SNIPPETS---------------{{{
"READ command:
"nnoremap ,html <cmd>-1read path/to/file.extension(cursor movement nonsense here)
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
luafile $HOME/.config/nvim/plugin-configs/feline/feline.lua
luafile $HOME/.config/nvim/config.lua
"}}}

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
set foldmethod=manual
setlocal foldmethod=indent
set nofoldenable
set foldlevel=99
set termguicolors
nnoremap <leader>, <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <silent><leader>bd <cmd>bd<cr>
nnoremap <silent><leader>bc <cmd>BufferClose<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>vs <cmd>vs<cr>
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

" function ReloadConfig() {
  "<cmd>source ~/.config/nvim/init.vim<cr>
  "echo Reloaded settings."
"}
" endfunction

"
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

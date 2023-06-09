set number
set relativenumber

let g:mapleader = ","

nnoremap <leader>vs :vs<cr>
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>sp :split<cr>

"saves and reloads
nnoremap <F3> :wa<cr>
nnoremap <leader>r :source $MYVIMRC<cr><cmd>echo "reloaded"<cr>

" windows
nnoremap <leader>ww <C-w>w
nnoremap <leader>wx <C-w>c

" resize windows
nnoremap <leader>d :vertical resize +4<cr>
nnoremap <leader>a :vertical resize -4<cr>
nnoremap <leader>w :resize +1<cr>
nnoremap <leader>s :resize -1<cr>

"tabs
nnoremap <leader>tx :tabclose<cr>
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>tx :tabclose<cr>

"indents
nnoremap <leader><Tab> magg=G'azz

" center search results on the page
nnoremap n nzzzv
nnoremap N Nzzzv

"folds
nnoremap <leader>fd :set foldlevel=1<cr><cmd>echo "Folding..."<cr>
nnoremap <leader>uf :set foldlevel=99<cr><cmd>echo "Unfolding..."<cr>

"buffers and splits
noremap <leader>n :bn<cr>
nnoremap <leader>N :bp<cr>
nnoremap <leader>vs :vs<cr><C-w>w
nnoremap <leader>sp :sp<cr>
nnoremap <leader>c <C-w><C-c><cr>
nnoremap <leader>` :sp<cr><C-w>w<cmd>terminal<cr>i

"insert mode goodies
inoremap <C-Cr> <Cr><Cr><Up><BS><Cr>

call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
call plug#end()

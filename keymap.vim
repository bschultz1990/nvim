" https://alldrops.info/posts/vim-drops/2018-05-15_understand-vim-mappings-and-create-your-own-shortcuts/
"=======================================================
"                       KEYMAPS
"=======================================================
let mapleader = ','
set timeoutlen=500
nnoremap sv :source $MYVIMRC<CR>

"Normal Mode
nnoremap <C-S-Down> :m .+1<CR>==
nnoremap <C-S-Up> :m .-2<CR>==
"" Insert mode
inoremap <C-S-Down> <ESC>:m .+1<CR>==gi
inoremap <C-S-Up> <ESC>:m .-2<CR>==gi
" Visual mode
vnoremap <C-S-Down> :m '>+1<CR>gv=gv
vnoremap <C-S-Up> :m '<-2<CR>gv=gv

nnoremap <C-d> :Dirbuf<CR> 
nnoremap <silent> <Leader><space> :WhichKey<CR>

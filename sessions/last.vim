let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/FarmStand
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +59 index.js
badd +10 views/products/new.ejs
badd +17 package.json
argglobal
%argdel
edit index.js
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 128) / 256)
exe 'vert 2resize ' . ((&columns * 112 + 128) / 256)
exe 'vert 3resize ' . ((&columns * 112 + 128) / 256)
argglobal
enew
file NvimTree_1
balt views/products/new.ejs
setlocal fdm=manual
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal nofen
lcd ~/Documents/FarmStand
wincmd w
argglobal
balt ~/Documents/FarmStand/package.json
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 59 - ((51 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 59
normal! 02|
lcd ~/Documents/FarmStand
wincmd w
argglobal
if bufexists(fnamemodify("~/Documents/FarmStand/views/products/new.ejs", ":p")) | buffer ~/Documents/FarmStand/views/products/new.ejs | else | edit ~/Documents/FarmStand/views/products/new.ejs | endif
if &buftype ==# 'terminal'
  silent file ~/Documents/FarmStand/views/products/new.ejs
endif
balt ~/Documents/FarmStand/index.js
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 11 - ((10 * winheight(0) + 31) / 62)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 11
normal! 064|
lcd ~/Documents/FarmStand
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 128) / 256)
exe 'vert 2resize ' . ((&columns * 112 + 128) / 256)
exe 'vert 3resize ' . ((&columns * 112 + 128) / 256)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +7 lua/configs/ultisnips_c.lua
badd +115 lua/plugins_c.lua
badd +0 lua/configs/luasnip_c.lua
badd +0 lua/configs/nvim-lspconfig_c.lua
argglobal
%argdel
edit lua/plugins_c.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
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
exe '1resize ' . ((&lines * 33 + 34) / 69)
exe 'vert 1resize ' . ((&columns * 142 + 142) / 284)
exe '2resize ' . ((&lines * 33 + 34) / 69)
exe 'vert 2resize ' . ((&columns * 142 + 142) / 284)
exe 'vert 3resize ' . ((&columns * 141 + 142) / 284)
argglobal
balt lua/configs/ultisnips_c.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
14
normal! zo
23
normal! zo
106
normal! zo
141
normal! zo
let s:l = 115 - ((17 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 115
normal! 06|
lcd ~/.config/nvim
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/configs/nvim-lspconfig_c.lua", ":p")) | buffer ~/.config/nvim/lua/configs/nvim-lspconfig_c.lua | else | edit ~/.config/nvim/lua/configs/nvim-lspconfig_c.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/configs/nvim-lspconfig_c.lua
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 123 - ((11 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 123
normal! 072|
lcd ~
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/nvim/lua/configs/luasnip_c.lua", ":p")) | buffer ~/.config/nvim/lua/configs/luasnip_c.lua | else | edit ~/.config/nvim/lua/configs/luasnip_c.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/nvim/lua/configs/luasnip_c.lua
endif
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 30 - ((29 * winheight(0) + 33) / 67)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 30
normal! 023|
lcd ~/.config/nvim
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 33 + 34) / 69)
exe 'vert 1resize ' . ((&columns * 142 + 142) / 284)
exe '2resize ' . ((&lines * 33 + 34) / 69)
exe 'vert 2resize ' . ((&columns * 142 + 142) / 284)
exe 'vert 3resize ' . ((&columns * 141 + 142) / 284)
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

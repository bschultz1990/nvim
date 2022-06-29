
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
"set cmdheight=0
set shortmess=F
set clipboard+=unnamedplus
set wildmenu"}}}

"----------------PLUGINS---------------{{{
" /home/bens/.local/share/nvim/plugged
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'lewis6991/gitsigns.nvim'
Plug 'feline-nvim/feline.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'phanviet/vim-monokai-pro'
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
" Try feline.nvim??
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
" colorscheme monokai_pro
let g:tokyonight_style = "storm"
colorscheme tokyonight
" "}}}

"----------------KEYBINDS---------------{{{
let mapleader = ','                                                                 "|Change leader. Default is \

" NORMAL MODE
""Move Line Down Or up like VSCode
nnoremap <C-Down> :m .+1<cr>
vnoremap <C-Down> :m .+1<cr>
nnoremap <C-Up> :m .-2<cr>
vnoremap <C-Up> :m .-2<cr>
nnoremap <leader>c <cmd>Lexplore<cr>
nnoremap <leader>, <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>fb <cmd>Telescope file_browser<cr>
nnoremap <leader>bd <cmd>bd<cr>
nnoremap <leader>w <cmd>bd<cr>
" nnoremap <leader>w <cmd>tabclose<cr>
nnoremap <leader>zz <cmd>ZenMode<cr>
nnoremap <leader>diff <cmd>DiffviewOpen<cr>
xmap ga <Plug>(EasyAlign)
map ga <Plug>(EasyAlign)
nnoremap <silent><nowait> <leader>k :call CocAction('jumpDefinition', v:false)<CR>
" nnoremap <silent><nowait> <leader>k <cmd>PreviewDefinition<CR>
nnoremap <silent><C-`> :ToggleTerm<cr>
nnoremap <silent><C-/> :Commentary<cr>

""TODO: INSERT MODE
"inoremap <C-BS> <cmd>dw<cr>}}}

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
" function! breakhabits#createmappings(keys, message) abort
"     for key in a:keys
"         call nvim_set_keymap('n', key, ':call BreakHabitsWindow(' . string(a:message). ')<CR>', {'silent': v:true, 'nowait': v:true, 'noremap': v:true})
"     endfor
" endfunction

function! BreakHabitsWindow(message) abort
    " Define the size of the floating window
    let width = 50
    let height = 10

    " Create the scratch buffer displayed in the floating window
    let buf = nvim_create_buf(v:false, v:true)

    " create the lines to draw a box
    let horizontal_border = '+' . repeat('-', width - 2) . '+'
    let empty_line = '|' . repeat(' ', width - 2) . '|'
    let lines = flatten([horizontal_border, map(range(height-2), 'empty_line'), horizontal_border])
    " set the box in the buffer
    call nvim_buf_set_lines(buf, 0, -1, v:false, lines)

    " Create the lines for the centered message and put them in the buffer
    let offset = 0
    for line in a:message
        let start_col = (width - len(line))/2
        let end_col = start_col + len(line)
        let current_row = height/2-len(a:message)/2 + offset
        let offset = offset + 1
        call nvim_buf_set_text(buf, current_row, start_col, current_row, end_col, [line])
    endfor

    " Set mappings in the buffer to close the window easily
    let closingKeys = ['<Esc>', '<CR>', '<Leader>']
    for closingKey in closingKeys
        call nvim_buf_set_keymap(buf, 'n', closingKey, ':close<CR>', {'silent': v:true, 'nowait': v:true, 'noremap': v:true})
    endfor

    " Create the floating window
    let ui = nvim_list_uis()[0]
    let opts = {'relative': 'editor',
                \ 'width': width,
                \ 'height': height,
                \ 'col': (ui.width/2) - (width/2),
                \ 'row': (ui.height/2) - (height/2),
                \ 'anchor': 'NW',
                \ 'style': 'minimal',
                \ }
    let win = nvim_open_win(buf, 1, opts)

    " Change highlighting
    call nvim_win_set_option(win, 'winhl', 'Normal:ErrorFloat')
endfunction


" FLOATING WINDOW FUNCTION
" --------------------------------------
function! FloatingWindow(message) abort
    " Define the size of the floating window
    let width = 50
    let height = 10

    " Create the scratch buffer displayed in the floating window
    let buf = nvim_create_buf(v:false, v:true)

    " create the lines to draw a box
    let horizontal_border = '+' . repeat('-', width - 2) . '+'
    let empty_line = '|' . repeat(' ', width - 2) . '|'
    let lines = flatten([horizontal_border, map(range(height-2), 'empty_line'), horizontal_border])
    " set the box in the buffer
    call nvim_buf_set_lines(buf, 0, -1, v:false, lines)

    " Create the lines for the centered message and put them in the buffer
    let offset = 0
    for line in a:message
        let start_col = (width - len(line))/2
        let end_col = start_col + len(line)
        let current_row = height/2-len(a:message)/2 + offset
        let offset = offset + 1
        call nvim_buf_set_text(buf, current_row, start_col, current_row, end_col, [line])
    endfor

    " Set mappings in the buffer to close the window easily
    let closingKeys = ['<Esc>', '<CR>', '<Leader>']
    for closingKey in closingKeys
        call nvim_buf_set_keymap(buf, 'n', closingKey, ':close<CR>', {'silent': v:true, 'nowait': v:true, 'noremap': v:true})
    endfor

    " Create the floating window
    let ui = nvim_list_uis()[0]
    let opts = {'relative': 'editor',
                \ 'width': width,
                \ 'height': height,
                \ 'col': (ui.width/2) - (width/2),
                \ 'row': (ui.height/2) - (height/2),
                \ 'anchor': 'NW',
                \ 'style': 'minimal',
                \ }
    let win = nvim_open_win(buf, 1, opts)

    " Change highlighting
    call nvim_win_set_option(win, 'winhl', 'Normal:ErrorFloat')
endfunction
" END FLOATING WINDOW FUNCTION
" --------------------------------------

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

   " Experimental feature (preview definition): gp, `<leader>K`, or <Shift-F12>:
   " Peek into the definition in a floating window.
   " TODO: If there are 2+ definitions, it does not work with floating windows (coc.nvim problem)
  command! -nargs=0 PreviewDefinition :call CocActionAsync('jumpDefinition', ':OpenAsPreview')
  command! -nargs=* OpenAsPreview :call s:open_as_preview("<args>")
  function! s:open_as_preview(callstr)
    "" e.g. the string should look like: +call cursor(<line>,<col>) <filename>
    let m = matchlist(a:callstr, '^+call cursor(\(\d\+\),\s*\(\d\+\))\s\+\(.*\)')
    let linenr = m[1]
    let filename = expand(m[3])
    call quickui#preview#open(filename, {
          \ 'cursor': linenr,
          \ 'number' : 1,
          \ 'persist': 0,
          \ })
  endfunction
  """ <F24> = <Shift-F12>
  "nmap <F24>         :<C-U>PreviewDefinition<CR>
  "nmap <leader>K     :<C-U>PreviewDefinition<CR>
  "nmap <silent> gp   :<C-U>PreviewDefinition<CR>
"}}}

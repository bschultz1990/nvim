require('functions')
require('base')
require('keymaps')
vim.cmd([[
call plug#begin()

Plug 'windwp/nvim-autopairs'
Plug 'sainnhe/sonokai'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'elihunter173/dirbuf.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

nnoremap ga = <Plug>(EasyAlign)
]])

-- Plenary setup:
local async = require "plenary.async"

--require('keymaps_plugins_c')
--require('test')

local ok, _ = pcall(vim.cmd, 'colorscheme sonokai')
if not ok then
        vim.cmd 'colorscheme default' -- if the above fails, then use default
end



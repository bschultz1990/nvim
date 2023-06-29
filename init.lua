require('functions')
require('base')
require('keymaps')
vim.cmd([[
call plug#begin()

Plug 'windwp/nvim-autopairs'
Plug 'stevearc/oil.nvim'
Plug 'sainnhe/sonokai'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-commentary'

call plug#end()
]])

require("oil").setup()
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- Plenary setup:
local async = require "plenary.async"

--require('keymaps_plugins_c')
--require('test')

local ok, _ = pcall(vim.cmd, 'colorscheme sonokai')
if not ok then
        vim.cmd 'colorscheme default' -- if the above fails, then use default
end

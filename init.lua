require('functions')
require('base')
require('keymaps')
vim.cmd([[
call plug#begin()
  Plug 'windwp/nvim-autopairs'
  Plug 'stevearc/oil.nvim'
call plug#end()
]])

require("oil").setup()
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

--require('keymaps_plugins_c')
--require('test')


require('functions')
require('base')
require('keymaps')
require('plugins')
require('keymaps_plugins')
require('configs/telescope_c')

-- Colorscheme Assignment
local ok, _ = pcall(vim.cmd, 'colorscheme sonokai')
if not ok then
        vim.cmd 'colorscheme default' -- if the above fails, then use default
end

-- Experimental
--require('test')

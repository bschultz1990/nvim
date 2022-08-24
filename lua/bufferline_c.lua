local bufferline_c = {}
local lualine_c = require("lualine_c")

lualine_c.Testing123()

vim.opt.termguicolors = true
require("bufferline").setup{}

return bufferline_c

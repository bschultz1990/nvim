-- need help?
-- :h nvim-treesitter-commands

local treesitter_c = {}

-- local lualine = require("lualine_c")

-- lualine.Testing123()

require 'nvim-treesitter.configs'.setup{
  ensure_installed = {'html', 'php', 'css', 'javascript', 'lua'},
  sync_install = true,
  auto_install = true,
  highlight = { enable = true },
  additional_vim_regex_highlighting = false,
  indent = { enable = true },
}

return treesitter_c

-- PLUGIN
-- Install from a Telescope-powered list of nvim-treesitter language parsers

local table = require('nvim-treesitter').get_available(2)

for key, value in ipairs(table) do
  print(key, vim.inspect(value))
end

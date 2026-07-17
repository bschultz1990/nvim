vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
})

require('mini.icons').setup()
require('mini.pairs').setup()
require('mini.align').setup()
require('mini.files').setup()
-- require('mini.tabline').setup()
require('mini.statusline').setup()
require('mini.clue').setup()

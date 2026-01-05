return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.icons').setup()
      -- require('mini.pairs').setup()
      require('mini.align').setup()
      require('mini.files').setup()
      require('mini.tabline').setup()
      require('mini.statusline').setup()
      require('mini.clue').setup()
    end
  },
}

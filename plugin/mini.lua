vim.pack.add({
    { src = 'https://github.com/echasnovski/mini.nvim', },
  })
      require('mini.icons').setup()
      require('mini.cmdline').setup()
      require('mini.pairs').setup()
      require('mini.align').setup()
      require('mini.files').setup()
      require('mini.tabline').setup()
      require('mini.statusline').setup()
      require('mini.clue').setup()

vim.keymap.set("n", "-", ":lua MiniFiles.open()<cr>", { desc = "Open files" })

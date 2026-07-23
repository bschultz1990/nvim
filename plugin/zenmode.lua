vim.pack.add({
  { src = 'https://github.com/folke/zen-mode.nvim',},
})

require('zen-mode').setup({
  plugins = {
    twilight = { enbaled = false }
  }
})

vim.keymap.set('n', '<leader>zz', '<cmd>ZenMode<cr>', { desc = "Enable ZenMode" })

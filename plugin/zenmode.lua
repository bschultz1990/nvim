vim.pack.add({
  { src = 'https://github.com/folke/zen-mode.nvim',},
})

local config = {
  plugins = {
    twilight = { enbaled = false }
  }
}

require('zen-mode').setup(config)

vim.keymap.set('n', '<leader>zz', '<cmd>ZenMode<cr>', { desc = "Enable ZenMode" })

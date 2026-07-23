vim.pack.add({
  { src = 'https://github.com/chrisgrieser/nvim-scissors' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' }
})

require('scissors').setup({
  editSnippetPopup = {
    keymaps = {
      deleteSnippet = "<leader>dd"
    }
  }
})

vim.keymap.set('n', '<leader>sa', '<cmd>ScissorsAddNewSnippet<cr>', { desc = "Snippet: Edit" })
vim.keymap.set('n', '<leader>se', '<cmd>ScissorsEditSnippet<cr>', { desc = "Snippet: Add" })


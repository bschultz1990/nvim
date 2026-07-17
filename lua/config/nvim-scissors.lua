vim.pack.add({
  { src = 'https://github.com/chrisgrieser/nvim-scissors' }
})

require("scissors").setup({
  editSnippetPopup = {
    keymaps = {
      deleteSnippet = "<leader>dd"
    }
  }
})

vim.keymap.set('n', '<leader>sa', '<cmd>ScissorsAddNewSnippet<cr>', { desc = "Snippet: Add" })
vim.keymap.set('n', '<leader>se','<cmd>ScissorsEditSnippet<cr>', { desc = "Snippet: Edit" })

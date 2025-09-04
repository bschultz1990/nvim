return {
  "chrisgrieser/nvim-scissors",
  dependencies = "nvim-telescope/telescope.nvim",
  opts = {
    editSnippetPopup = {
      keymaps = {
        deleteSnippet = "<leader>dd"
      }
    }
  },
  keys = {
    { '<leader>sa', ':ScissorsAddNewSnippet<cr>', { desc = "Snippet: Edit" }, mode = 'n' },
    { '<leader>se', ':ScissorsEditSnippet<cr>', { desc = "Snippet: Add" }, mode = { 'x', 'n' } }
  },
}

return {
  "chrisgrieser/nvim-scissors",
  dependencies = "nvim-telescope/telescope.nvim",
  opts = {
    snippetDir = UserSnippetDir
  },
  keys = {
    { '<leader>sa', ':ScissorsAddNewSnippet<cr>', { desc = "Snippet: Edit" }, mode = 'n' },
    { '<leader>se', ':ScissorsEditSnippet<cr>', { desc = "Snippet: Add" }, mode = { 'x', 'n' } }
  },
}

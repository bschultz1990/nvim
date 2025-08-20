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
  config = function ()
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   desc = "Format snippets on save using ",
    --   pattern = ".json",
    --   group = vim.api.nvim_create_augroup("groupname", { clear = true }),
    --   callback = function()
    --     vim.cmd'!cd '.. UserSnippetDir
    --     vim.cmd'!find  -name "*.json" | xargs -I {} yq --inplace --output-format=json "sort_keys(..)" {}'
    --   end,
    -- })
  end

}

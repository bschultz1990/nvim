return   {
  "preservim/vim-pencil",
  cmd = {
    "Pencil",
    "PencilOff",
    "PencilToggle",
    "PencilSoft",
    "PencilHard",
  },
  keys = {
    { '<leader>ps', ':PencilSoft<cr>', { desc = 'PencilSoft' }, mode = 'n' },
    { '<leader>po', ':PencilOff<cr>', { desc = 'PencilOff' }, mode = 'n' },
  },
  ft = { "text", "markdown", "plaintex" },
  config = function()
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = { "*.txt", "*.tex" },
      command = "PencilSoft",
    })
  end,
}

return   {
  "preservim/vim-pencil",
  cmd = {
    "Pencil",
    "PencilOff",
    "PencilToggle",
    "PencilSoft",
    "PencilHard",
  },

  ft = { "text", "markdown", "plaintex" },
  config = function()
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = { "*.txt", "*.tex" },
      command = "PencilSoft",
    })
  end,
}

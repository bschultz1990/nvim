vim.pack.add({
  { src = 'https://github.com/preservim/vim-pencil', },
})

-- require('vim-pencil').setup({
--
-- })

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.txt", "*.tex" },
  command = "PencilSoft",
})


vim.keymap.set('n', '<leader>ps', '<cmd>PencilSoft<cr>', { desc = "Pencil Soft" })
vim.keymap.set('n', '<leader>pt', '<cmd>PencilToggle<cr>', { desc = "Pencil Toggle" })

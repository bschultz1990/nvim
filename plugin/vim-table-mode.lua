vim.pack.add({
  { src = 'https://github.com/dhruvasagar/vim-table-mode', },
})

-- require('vim-table-mode').setup({ })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  desc = "Table keymaps for specific buffers",
  pattern = { "*.md", "*.txt", "*.tex" },
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "i", "|", "|<Esc>:TableModeRealign<cr>A", { desc = "Table Mode Realign" })
    -- vim.api.nvim_buf_set_keymap(0, "n", "<leader>ta", ":TableModeToggle<cr>", { desc = "Table Mode Toggle" })
  end,
})


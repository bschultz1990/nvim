vim.pack.add({
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },
})

require('telescope').setup{

  layout_stragety = "flex",
  extensions = { ['ui-select'] = {
    require('telescope.themes').get_dropdown(),
  }},

  vim.keymap.set("n", "<leader>?", ":Telescope help_tags<cr>", { desc = "Telescope help tags" }),
  vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<cr>", { desc = "Telescope keymaps" }),
  vim.keymap.set("i", "<C-;>", "<cmd>Telescope symbols<cr>", { desc = "Telescope symbols" }),
  vim.keymap.set("n", "<leader>rg", ":Telescope live_grep<cr>", { desc = "Live grep" }),
  vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Find files" }),
  vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>", { desc = "Old Files" }),
  vim.keymap.set("n", "<leader>bb", ":Telescope buffers<cr>", { desc = "Buffers" }),

}


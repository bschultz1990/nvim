vim.pack.add({
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },
})

require('telescope').setup({
  layout_stragety = "flex",
  extensions = { ['ui-select'] = {
    require('telescope.themes').get_dropdown(),
  },
},

-- KEYMAPS
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  require 'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' }),
  })

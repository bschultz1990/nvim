return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  -- event = 'VimEnter',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  config = function()
    require('telescope').setup {
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
  }
end,
}

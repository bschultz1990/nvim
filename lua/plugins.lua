return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.icons').setup()
      require('mini.pairs').setup()
      require('mini.align').setup()
      require('mini.files').setup()
      require('mini.tabline').setup()
      require('mini.statusline').setup()
      require('pluginconfigs.clue')
    end
  },

  { import = "pluginconfigs.vim-surround" },
  { import = "pluginconfigs.vim-pencil" },
  { import = "pluginconfigs.vim-table-mode" },
  { import = "pluginconfigs.zenmode" },
  { import = "pluginconfigs.nvim-treesitter" },
  { import = "pluginconfigs.telescope" },
  { import = "pluginconfigs.nvim-scissors" },
  { import = "pluginconfigs.luasnip" },
  { import = "pluginconfigs.nvim-lspconfig-blink" },
  { import = "pluginconfigs.blink" },
  { import = "pluginconfigs.mason" },
  { import = "pluginconfigs.nvim-colorizer" },
  -- { import = "pluginconfigs.powershell" },
}

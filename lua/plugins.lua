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
      -- require('mini.surround').setup()
      -- require('mini.git').setup()
    end
  },

  { import = "pluginconfigs.vim-surround" },
  { import = "pluginconfigs.vim-pencil" },
  { import = "pluginconfigs.vim-table-mode" },
  { import = "pluginconfigs.zenmode" },
  { import = "pluginconfigs.nvim-treesitter" },
  { import = "pluginconfigs.telescope" },
  { import = "pluginconfigs.coc" },
  { import = "pluginconfigs.nvim-scissors" },
  {
    'tanvirtin/monokai.nvim',
    config = function()
      -- vim.cmd("colorscheme monokai_pro")
    end
  }
  -- { import = "pluginconfigs.nvim-lspconfig" },

  -- { import = "pluginconfigs.nvim-cmp" },
  -- { import = "pluginconfigs.powershell" },
  -- { import = "pluginconfigs.nvim-lspconfig-blink" },
  -- { import = "pluginconfigs.blink" },
  -- { import = "pluginconfigs.mason" },
}

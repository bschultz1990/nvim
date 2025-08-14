M = {
  { 'echasnovski/mini.nvim', version = false,
  config = function ()
    require('mini.icons').setup()
    require('mini.surround').setup()
    require('mini.pairs').setup()
    require('mini.align').setup()
    require('mini.files').setup()
    -- require('mini.git').setup()
    require('mini.tabline').setup()
    require('mini.statusline').setup()
    require('pluginconfigs.clue')
  end
},


{ 'neovim/nvim-lspconfig', config = function () require('pluginconfigs.nvim-lspconfig') end },


{
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "bash-language-server",
      "css-lsp",
      "emmet-language-server",
      "html-lsp",
      "lua-language-server",
      "powershell-editor-services",
      "prettier",
      "ruff",
      "stylua",
      "tinymist",
      "typescript-language-server",
    },
  },
},


{
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    require('telescope').setup({
      layout_stragety = "flex",
    })
  end
},


}
return M

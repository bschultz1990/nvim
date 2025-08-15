return {
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

{ import = "pluginconfigs.nvim-lspconfig" },
{ import = "pluginconfigs.blink" },
{ import = "pluginconfigs.mason" },
{ import = "pluginconfigs.telescope" }

}

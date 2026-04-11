-- ONLY FOR USE WITH NEOVIM 0.1-0.11.
-- NOT COMPATIBLE WITH NEOVIM 0.12

return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  -- This plugin does not support lazy loading.
  -- You MUST run config = function() instead of opts = {}
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      sync_install = true,
      ensure_installed = {
        "lua",
        "markdown_inline",
        "vim",
        "vimdoc",
      },
      highlight = { enable = true, },
      indent = { enable = true, },

    }
  end,
}

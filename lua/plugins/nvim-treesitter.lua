return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main', --main branch for Neovim 0.12 and beyond
  lazy = false,
  build = ":TSUpdate",
  -- This plugin does not support lazy loading.
  -- You MUST run config = function() instead of opts = {}

    config = function()
      require('nvim-treesitter').setup {
        auto_install = true,
        sync_install = true,
        -- highlight = { enable = true, },
        -- indent = { enable = true, },
      }

    --   local ensure_installed = {
    --     "lua",
    --     "markdown_inline",
    --     "vim",
    --     "vimdoc",
    --   }
    --
    --   local alreadyInstalled = require('nvim-treesitter.config').get_installed()
    --   local parsersToInstall = vim.iter(ensure_installed)
    --   :filter(function(parser)
    --     return not vim.tbl_contains(alreadyInstalled, parser)
    --   end)
    --   :totable()
    --   require('nvim-treesitter').install(parsersToInstall)
    -- end,
    --
    --
    -- Enable highlighting and indentation
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start) -- highlighting
        vim.bo.indentexpr = "v:lua.require'mvin-treesitter'.indentexpr()" -- indentation
      end,
    })
  -- }
end
}

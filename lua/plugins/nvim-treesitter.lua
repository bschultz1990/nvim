-- MIGRATION GUIDES
-- https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main


-- PREREQUISITES:
-- scoop install tree-sitter
-- c compiler


return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main', --main branch for Neovim 0.12 and beyond
  lazy = false,
  build = ":TSUpdate",


  -- This plugin does not support lazy loading.
  -- You MUST run config = function() instead of opts = {}


  config = function()
    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath('data') .. '/site' -- parser install directory
    }

    -- Set local c compiler
    if vim.loop.os_uname().sysname == "Windows_NT" then vim.env.CC = "gcc" end
    if vim.loop.os_uname().sysname == "Linux" then vim.env.CC = "gcc" end

    local ensure_installed = {
      "lua",
      "markdown_inline",
      "vim",
      "vimdoc",
    }


    local function checkParsers()
      local getAvailableParsers = require('nvim-treesitter.config').get_available()
      local currentFileType = vim.treesitter.language.get_lang(vim.o.filetype)

      for _, parser in ipairs(getAvailableParsers) do
        if currentFileType == parser then return true end
      end

      return false
    end


    local alreadyInstalled = require('nvim-treesitter.config').get_installed()
    local parsersToInstall = vim.iter(ensure_installed)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require('nvim-treesitter').install(parsersToInstall)


    vim.api.nvim_create_autocmd("BufEnter", {
      desc = "Enable auto-install of TreeSitter parsers",
      pattern = "*", -- filetype
      group = vim.api.nvim_create_augroup("TSAutoInstall", { clear = true }),
      callback = function()
        if checkParsers() then
          require('nvim-treesitter').install(vim.treesitter.language.get_lang(vim.o.filetype))
        end
      end,
    })


    -- Enable highlighting and indentation
    vim.api.nvim_create_autocmd('FileType', {
      desc = "Enable TreeSitter highlighting and indentation",
      pattern = "*", -- filetype
      callback = function()

        if checkParsers() then
          -- Enable treesitter highlighting and disable regex syntax
          -- Enable treesitter-based indentation
          pcall(vim.treesitter.start)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end

      end,
    })
  end,
}

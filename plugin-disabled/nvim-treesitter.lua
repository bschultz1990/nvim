-- MIGRATION GUIDES
-- https://www.qu8n.com/posts/treesitter-migration-guide-for-nvim-0-12
-- https://github.com/nvim-treesitter/nvim-treesitter/tree/main


-- PREREQUISITES:
-- scoop install tree-sitter
-- c compiler; preferably 'gcc'


vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = "main",
  },
})

require('nvim-treesitter').setup({
  install_dir = vim.fn.stdpath('data') .. '/site' -- parser install directory
})


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
  pattern = "*",  
  group = vim.api.nvim_create_augroup("TSAutoInstall", { clear = true }),  
  callback = function()
    if checkParsers() then
      local lang = vim.treesitter.language.get_lang(vim.o.filetype)  
      prompt = { prompt = string.format("Install TreeSitter parser for '%s'? (y/n):", lang) }

      vim.ui.input(
        prompt,
        function(input)
          if input and (string.lower(input) == 'y') then
            require('nvim-treesitter').install(lang)
          end
        end
      )
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


-- Enable auto build on plugin update
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end
})

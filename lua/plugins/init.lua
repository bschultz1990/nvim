local pwsh_services = vim.fn.expand("/mason/packages/powershell-editor-services")
local pwsh_start = vim.fn.expand("/PowerShellEditorServices/Start-EditorServices.ps1 -SessionDetailsPath ./session.json")
local pwsh_bundlepath = vim.fn.stdpath "data" .. pwsh_services


return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "TheLeoP/powershell.nvim",
    config = function()
      require("powershell").setup {
        bundle_path = pwsh_bundlepath,
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "powershell_es",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
      },
    },
  },
}

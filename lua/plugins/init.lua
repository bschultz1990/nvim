local pwsh_services = vim.fn.expand "/mason/packages/powershell-editor-services"
local pwsh_bundlepath = vim.fn.stdpath "data" .. pwsh_services

return {
  {
    "godlygeek/tabular",
    ft = { "markdown", "text", "plaintex" },
    config = function()
      vim.keymap.set("i", "|", "|<Esc>:Tabularize /|/l1<cr>A")
      vim.keymap.set("v", "ta", ":Tabularize /")
    end,
  },
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    opts = {},
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
  },
  {
    "preservim/vim-pencil",
    cmd = {
      "Pencil",
      "PencilOff",
      "PencilToggle",
      "PencilSoft",
      "PencilHard",
    },

    ft = { "markdown", "text", "plaintex" },
    config = function()
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = { "*.md", "*.txt", "*.tex" },
        command = "PencilSoft",
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  { "tpope/vim-surround", keys = { "ys", "cs", { "S", mode = "v" }, "ds" } },
  { "elihunter173/dirbuf.nvim", lazy = false },
  {
    "TheLeoP/powershell.nvim",
    ---@type powershell.user_config
    opts = { bundle_path = pwsh_bundlepath },
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
        "bash-language-server",
        "css-lsp",
        "html-lsp",
        "lua-language-server",
        "powershell-editor-services",
        "prettier",
        "stylua",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "html",
        "css",
        "python",
        "markdown",
      },
    },
  },
  -- Disabled plugins
  { "hrsh7th/cmp-buffer", enabled = false },
}

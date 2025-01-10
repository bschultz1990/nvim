local pwsh_services = vim.fn.expand "/mason/packages/powershell-editor-services"
local pwsh_bundlepath = vim.fn.stdpath "data" .. pwsh_services

return {
  -- { "atiladefreitas/dooing",
  --   cmd = { "Dooing" },
  --   keys = { "<leader>td" }
  -- },
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown", "text", "plaintex" },
    config = function()
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        desc = "Table keymaps for specific buffers",
        pattern = { "*.md", "*.txt", "*.tex" },
        callback = function()
          vim.api.nvim_buf_set_keymap(
            0,
            "i",
            "|",
            "|<Esc>:TableModeRealign<cr>A",
            { noremap = true, silent = true, desc = "Table Mode Realign" }
          )
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<leader>ta",
            ":TableModeToggle<cr>",
            { noremap = true, silent = true, desc = "Table Mode Toggle" }
          )
        end,
      })
    end,
  },

  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   opts = {},
  --   dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
  --   ft = { "markdown", "text", "plaintex" },
  --   config = function()
  --     require("render-markdown").setup {
  --       pipe_table = { style = "normal" },
  --     }
  --   end,
  -- },

  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    opts = {},
  },

  -- {
  --   "preservim/vim-pencil",
  --   cmd = {
  --     "Pencil",
  --     "PencilOff",
  --     "PencilToggle",
  --     "PencilSoft",
  --     "PencilHard",
  --   },
  --
  --   ft = { "text", "markdown", "plaintex" },
  --   config = function()
  --     vim.api.nvim_create_autocmd({ "BufEnter" }, {
  --       pattern = { "*.md", "*.txt", "*.tex" },
  --       command = "PencilSoft",
  --     })
  --   end,
  -- },

  { "tpope/vim-surround", keys = { "ys", "cs", { "S", mode = "v" }, "ds" } },

  { "elihunter173/dirbuf.nvim", lazy = false },

  {
    "TheLeoP/powershell.nvim",
    ---@type powershell.user_config
    ft = { "ps1" },
    opts = { bundle_path = pwsh_bundlepath },
    config = function()
      require("powershell").setup {
        bundle_path = pwsh_bundlepath,
      }
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

  -- TODO: Table deep extend for options? So far, these overwrite the defaults in chunks.
  {
    "hrsh7th/nvim-cmp",
    -- opts = function(_, conf)
      -- local cmp = require('cmp')
      -- conf.mapping = cmp.mapping.preset.insert({
      --   ['<Esc>'] = cmp.mapping.abort(),
        -- ['<Tab>'] = require ('cmp').mapping.confirm({ select = true })
      -- })
      -- conf.setup = cmp.setup({
        -- performance = { max_view_entries = 20 },
      -- })
      -- conf.sources = cmp.config.sources({
      --   { name = 'buffer' },
      -- })
      -- return conf
    -- end
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
        "markdown_inline",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "flex",
      },
    },
  },

  -- Disabled plugins
  { "hrsh7th/cmp-buffer", enabled = false },
}

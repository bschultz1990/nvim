local pwsh_services = vim.fn.expand "/mason/packages/powershell-editor-services"
local pwsh_bundlepath = vim.fn.stdpath "data" .. pwsh_services

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    keys = {
      { '<leader>rm', '<cmd>RenderMarkdown toggle<cr>', desc = 'RenderMarkdown' },
    },
    opts = {
      pipe_table = { style = "normal" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
    ft = { "markdown", "text", "plaintex" },
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

  ft = { "text", "markdown", "plaintex" },
  config = function()
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = { "*.md", "*.txt", "*.tex" },
      command = "PencilSoft",
    })
  end,
},

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {},
  },
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown", "text", "plaintex" },
    config = function()
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
        desc = "Table keymaps for specific buffers",
        pattern = { "*.md", "*.txt", "*.tex" },
        callback = function()
          vim.api.nvim_buf_set_keymap(0, "i", "|", "|<Esc>:TableModeRealign<cr>A", { desc = "Table Mode Realign" })
          vim.api.nvim_buf_set_keymap(0, "n", "<leader>ta", ":TableModeToggle<cr>", { desc = "Table Mode Toggle" })
        end,
      })
    end,
  },

  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },

  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    opts = {},
  },

  { "tpope/vim-surround", keys = { "ys", "cs", { "S", mode = "v" }, "ds" } },

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
        "pyright",
        "stylua",
        "typescript-language-server",
        "emmet-language-server",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    config = function(_, default_opts)
      local merged_opts = vim.tbl_deep_extend("force", default_opts, {
        mapping = {
          ["<Esc>"] = require("cmp").mapping.abort(),
        },
      })
      require("cmp").setup(merged_opts)
    end,
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
        "sql",
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
  { "nvim-tree", enabled = false },
}

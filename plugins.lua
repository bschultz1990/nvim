local pwsh_services = vim.fn.expand "/mason/packages/powershell-editor-services"
local pwsh_bundlepath = vim.fn.stdpath "data" .. pwsh_services



return {

  {
    "hrsh7th/nvim-cmp", enabled = true,
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
    'saghen/blink.cmp',
    enabled = false,
    lazy = false,
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip', version = 'v2.*' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      snippets = { preset = 'luasnip', 'friendly-snippets'},
      -- ensure you have the `snippets` source (enabled by default)
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappingssearch_paths
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'default' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        -- providers = {
        --   snippets = {
        --     opts = {
        --       search_paths = {
        --         "C:/Users/bjs19/AppData/Local/nvim/lua/user/snippets",
        --       },
        --     },
        --   },
        -- },
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },

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
        pattern = { "*.txt", "*.tex" },
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
        "emmet-language-server",
        "html-lsp",
        "lua-language-server",
        "powershell-editor-services",
        "prettier",
        "pyright",
        "stylua",
        "tinymist",
        "typescript-language-server",
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
  { "nvim-tree/nvim-tree.lua", enabled = false, },
}

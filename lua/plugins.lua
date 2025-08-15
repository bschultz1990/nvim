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


{ 'neovim/nvim-lspconfig', config = function () require('pluginconfigs.nvim-lspconfig') end },


{
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap

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
      "ruff",
      "stylua",
      "tinymist",
      "typescript-language-server",
    },
  },
},


{
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    require('telescope').setup({
      layout_stragety = "flex",
    })
  end
},
}

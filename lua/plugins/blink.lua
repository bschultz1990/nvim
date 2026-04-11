return {
  'saghen/blink.cmp',
  -- staying on stable until version 2 drops
  -- when finished version 2 will require blink.lib https://github.com/saghen/blink.lib
  version = '1.*',
  event = { 'BufReadPost', 'CmdlineEnter' },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config

  opts = {
    keymap = { preset = 'default' },
    fuzzy = { implementation = "lua" },
    signature = { enabled = true },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = false } },
    -- `lsp`, `buffer`, `snippets`, `path` and `omni` are built-in
    sources = {
      default = { 'lsp', 'path', 'snippets' },
    },
  },
}

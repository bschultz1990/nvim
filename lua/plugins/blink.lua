return {
  'saghen/blink.cmp',
  dependencies = {},
  version = '1.*',
  event = 'BufReadPost',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    signature = { enabled = true },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = false } },
    sources = {
      default = { 'lsp', 'path', 'snippets' },
    },
  },
}

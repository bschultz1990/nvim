return {
  'saghen/blink.cmp',
  dependencies = { 'L3MON4D3/LuaSnip' },
  version = '1.*',
  event = {'BufReadPost', 'CmdlineEnter'},

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    signature = { enabled = true },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = false } },
    -- `lsp`, `buffer`, `snippets`, `path` and `omni` are built-in
    sources = {
      default = { 'lsp', 'path', 'snippets' },
    },
  },
}

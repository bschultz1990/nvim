return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',

  opts = {
    keymap = { preset = 'default' },
    signature = { enabled = true },

    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = { documentation = { auto_show = false } },
    -- opts_extend = { "sources.default" }
  },
}

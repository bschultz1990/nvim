vim.pack.add({
	{ src = 'https://github.com/saghen/blink.cmp',
	version = vim.version.range('1.x')
}
})

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config

require('blink.cmp').setup({
    keymap = { preset = 'default' },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = false } },
    -- `lsp`, `buffer`, `snippets`, `path` and `omni` are built-in
    sources = {
    default = { 'lsp', 'path', 'snippets' },
    }
})

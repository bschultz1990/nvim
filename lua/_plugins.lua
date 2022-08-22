plugins = {
  'vim-notify_c',
  'telescope_c',
  'nvim-cmp_c',
  -- 'nvim-lspconfig_c',
  'bufferline_c',
  'nvim-autopairs_c',
  'lualine_c',
}

for _, plug in ipairs(plugins) do
  require(plug)
end

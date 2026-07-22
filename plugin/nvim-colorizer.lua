vim.pack.add({
  { src = 'https://www.github.com/catgoose/nvim-colorizer.lua' },
})

vim.o.termguicolors = true

require("colorizer").setup({
  css = true,
  css_fn = true,
  tailwind = true,
})

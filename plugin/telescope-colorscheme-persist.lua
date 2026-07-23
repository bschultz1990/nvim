vim.pack.add({
  { src = 'https://github.com/tingey21/telescope-colorscheme-persist.nvim', },
})

require('telescope-colorscheme-persist').setup({
  file_path = vim.fn.stdpath("cache") .. "/telescope-colorscheme-persist.nvim/.nvim.colorscheme-persist.lua",
  fallback = "default",
  picker_opts = require("telescope.themes").get_dropdown(),
  debug = false,
  keybind = "<leader>th",

})

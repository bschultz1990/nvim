vim.pack.add {
  "https://github.com/brianaung/compl.nvim",
}

require("compl").setup {
  -- Default options (no need to set them again)
  completion = {
    fuzzy = true,
    timeout = 100,
  },
  info = {
    enable = true,
    timeout = 100,
  },
  snippet = {
    enable = true,
    paths = {
      -- Optional: point to the package.json manifest of an installed snippet collection.
      vim.fn.stdpath('config') .. "/snippets/"
    },
  },
}

vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess:append "c"

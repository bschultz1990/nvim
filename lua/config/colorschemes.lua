function neovideTitleColor (color)
  if vim.g.neovide then
    vim.g.neovide_title_background_color = color
  end
end

-- DARK
vim.cmd("colorscheme miniautumn") neovideTitleColor ("#1a141d")
-- vim.cmd("colorscheme miniwinter") neovideTitleColor ("#051a20")
-- vim.cmd("colorscheme minicyan") neovideTitleColor ("#0a2a2a")
-- vim.cmd("colorscheme slate") neovideTitleColor ("#262626")
-- vim.cmd("colorscheme minischeme") neovideTitleColor ("#112641")

-- LIGHT
-- vim.cmd("colorscheme peachpuff") neovideTitleColor ("#000000")
-- vim.cmd("colorscheme morning") neovideTitleColor ("#000000")

local function scs (scheme, bg, nv_banner)
  vim.cmd("colorscheme "..scheme)
  vim.opt.background = bg
  if vim.g.neovide then
    vim.g.neovide_title_background_color = nv_banner
  end

end

-- DARK
scs("miniautumn", "dark", "#262029")
-- scs("miniwinter", "dark", "#11262d")
-- scs("minicyan", "dark", "#0a2a2a")
-- scs("slate", "dark", "#262626")
-- scs("minischeme", "dark", "#112641")

-- LIGHT
-- scs("peachpuff", "light", "#000000")
-- scs("morning", "dark", "#FFFFFF")

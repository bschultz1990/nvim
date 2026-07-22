M = {}


M.Scs = function (scheme, bg, nv_banner)
  scheme = scheme or "default"
  bg = bg or ""
  nv_banner = nv_banner or "#000000"
  vim.cmd("colorscheme "..scheme)
  vim.opt.background = bg
  if vim.g.neovide then
    vim.g.neovide_title_background_color = nv_banner
  end
  return scheme, bg, nv_banner
end


M.schemes = {
  ['miniautumn'] = function() return M.Scs ('miniautumn', 'dark', '#262029') end,
  ['minicyan'] = function() return M.Scs ('minicyan', 'dark', '#0a2a2a') end,
  ['minispring'] = function() return M.Scs ('minispring', 'dark', '') end,
  ['minischeme'] = function() return M.Scs ('minischeme', 'dark', '#112641') end,
  ['minisummer'] = function() return M.Scs ('minisummer', 'dark', '#1b1512') end,
  ['miniwinter'] = function() return M.Scs ('miniwinter', 'dark', '#11262d') end,
  ['monokai-pro'] = function() return M.Scs ('monokai-pro', 'dark', '#2d2a2e') end,
  ['morning'] = function() return M.Scs ('morning', 'light', '#FFFFFF') end,
  ['peachpuff'] = function() return M.Scs ('peachpuff', 'light', '#000000') end,
  ['retrobox'] = function() return M.Scs ('retrobox', 'dark', '#1c1c1c') end,
  ['slate'] = function() return M.Scs ('slate', 'dark', '#262626') end,
}

-- TODO: Extend M.schemes to include built-in color schemes

return M

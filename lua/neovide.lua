if vim.g.neovide then
  UI_scale = 1.0
  -- vim.o.guifont="*" -- for a font list prompt at Neovide startup
  -- vim.o.guifont="JetBrainsMonoNL Nerd Font Mono:h12"
  vim.o.guifont="JetBrainsMonoNL Nerd Font:h12"
  -- vim.o.guifont="Inconsolata Nerd Font:h14"
  -- vim.o.guifont="NotoMono Nerd Font Mono:h12"
  -- vim.o.guifont="Hack Nerd Font Mono:h12"
  vim.g.neovide_scale_factor = UI_scale
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function() change_scale_factor(1.1) end)
  vim.keymap.set("n", "<C-->", function() change_scale_factor(1 / 1.1) end)
  vim.keymap.set("n", "<C-0>", function() vim.g.neovide_scale_factor = UI_scale end)
  vim.keymap.set("n", "<M-Cr>", function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)
  end

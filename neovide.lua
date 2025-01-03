if vim.g.neovide then
  UI_scale = 1
  -- vim.o.guifont="*" -- for a font list prompt at Neovide startup
  vim.o.guifont="JetBrainsMonoNL Nerd Font Mono:h12"
  vim.g.neovide_scale_factor = UI_scale
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function() change_scale_factor(1.1) end)
  vim.keymap.set("n", "<C-->", function() change_scale_factor(1 / 1.1) end)
  vim.keymap.set("n", "<C-0>", function() vim.g.neovide_scale_factor = UI_scale end)
end

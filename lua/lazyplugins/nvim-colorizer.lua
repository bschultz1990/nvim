return {
  "catgoose/nvim-colorizer.lua",
  cmd = {
    "ColorizerToggle",
    "ColorizerAttachToBuffer",
    "ColorizerDetatchFromBuffer",
    "ColorizerReloadAllBuffers"
  },
  config = function()
    vim.o.termguicolors = true
    require("colorizer").setup({
      css = true,
      css_fn = true,
      tailwind = true,
    })
  end
}

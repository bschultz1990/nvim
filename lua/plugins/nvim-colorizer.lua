return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    vim.o.termguicolors = true
    require("colorizer").setup({
      css = true,
      css_fn = true,
      tailwind = true,
    })
  end
}

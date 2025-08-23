return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "vim",
      "vimdoc",
      "lua",
      "html",
      "css",
      "python",
      "markdown",
      "markdown_inline",
      "sql",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
  },
}

return {
  "nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate",
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
  },
}

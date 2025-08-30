return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    ensure_installed = {
      "vim",
      "vimdoc",
      "lua",
      "html",
      "css",
      "python",
      "powershell",
      "markdown",
      "markdown_inline"
    },
    highlight = {
      enable = true,
      -- use_languagetree = true,
      -- additional_vim_regex_highlighting = true
    },
    indent = { enable = true }
  },
}

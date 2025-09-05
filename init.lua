-- require("start.snippet_pkg_generator")
require("config.lazy")

-- Source all lua files from a path
vim.cmd('runtime! lua/config/*.lua')

UserSnippetDir = vim.fn.stdpath("config") .. "/snippets/"

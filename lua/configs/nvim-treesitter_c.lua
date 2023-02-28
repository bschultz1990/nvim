local M = {}

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "markdown", "html", "css", "javascript", "markdown", "markdown_inline"},

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
}

return M

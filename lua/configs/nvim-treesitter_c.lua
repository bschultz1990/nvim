local M = {}

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "markdown", "html", "css", "javascript" },

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = false,
}

return M

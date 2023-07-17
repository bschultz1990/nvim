local M = {}

function FilePathStatusLine()
	local path = vim.fn.expand('%:p')
	local home = vim.fn.expand('~')
	local short_path = string.gsub(path, home, '~')
	return short_path
end

require('lualine').setup {
	options = {
		icons_enabled = true,
		-- see https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md for a full list of themes
		theme = 'auto',
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '▌', right = '▐'},

		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true, -- true: single bar on bottom. false: one bar per window
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	-- section options
	-- `branch` (git branch)
	-- `buffers` (shows currently available buffers)
	-- `diagnostics` (diagnostics count from your preferred source)
	-- `diff` (git diff status)
	-- `encoding` (file encoding)
	-- `fileformat` (file format)
	-- `filename`
	-- `filesize`
	-- `filetype`
	-- `hostname`
	-- `location` (location in file in line:column format)
	-- `mode` (vim mode)
	-- `progress` (%progress in file)
	-- `searchcount` (number of search matches when hlsearch is active)
	-- `tabs` (shows currently available tabs)
	-- `windows` (shows currently available windows)
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = { FilePathStatusLine },
		-- lualine_c = {'filename'},
		lualine_x = { 'diff', 'encoding', 'diagnostics', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

return M

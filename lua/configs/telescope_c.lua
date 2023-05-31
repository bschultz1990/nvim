local M = {}

require('telescope').setup {
	extensions = {
		file_browser = {
			-- hijack_netrw = true,
			hidden = true,
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown {

			},
		},
	},
	defaults = {
		file_ignore_patterns = {'%.git', '%.npm', '%node_modules', '^go/', '^src/'},
		layout_strategy = 'vertical',
		layout_config = {
			height = 125,
		}
	},
	pickers = {
		find_files = {
			hidden = true
			-- find_command = {'fzf'},
		},
		colorscheme = {
			enable_preview = true
		}
	}
}
-- Load Extra Extensions
require("telescope").load_extension "file_browser"
require("telescope").load_extension "ui-select"


return M

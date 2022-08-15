--require("toggleterm").setup{}
require('gitsigns').setup{
signcolumn = false,
}
require("telescope").setup {
	extensions = {},
	defaults = {
--    file_ignore_patterns = {"^/home/bens/.local/", "^home/bens/.var/", "%.git", "%.npm", "%.mozilla", "%.cache", "%node_modules"},
		},
	pickers = {
    live_grep = {},
		find_files = {
--			find_command = {"fdfind"},
--			hidden = {true},
--      search_dirs = {"$HOME", "D:/"}
			},
		}
	}
require("telescope").load_extension ("file_browser")

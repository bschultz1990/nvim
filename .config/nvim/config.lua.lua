require("toggleterm").setup{}
-- require('feline').setup()
require('gitsigns').setup{
signcolumn = false,
}
require("telescope").setup {
	extensions = {
		-- file_browser = {
		-- 	hijack_netrw = true,
		-- },
		-- telescope_file_browser.finders.browse_folders({
		-- 		path = {"~/"},
		-- 		hidden = {true}
		-- 	}),
	},
	defaults = {
    file_ignore_patterns = {"^/home/bens/.local/", "^home/bens/.var/", "%.git", "%.npm", "%.mozilla", "%.cache", "%node_modules"},
		},
	pickers = {
    live_grep = {},
		find_files = {
			find_command = {"fdfind"},
			hidden = {true},
      search_dirs = {"~/"}
			},
		}
	}
require("telescope").load_extension ("file_browser")
require("telescope").load_extension ("fzf")

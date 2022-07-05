require("toggleterm").setup{}
-- require('feline').setup()
-- require('monokai').setup { palette = require('monokai').pro }
--require('monokai').setup { palette = require('monokai').soda }
--require('monokai').setup { palette = require('monokai').ristretto }
require('gitsigns').setup{
signcolumn = false,
}
require("telescope").setup {
	defaults = {
    file_ignore_patterns = {"^/home/bens/.local/", "%.git", "%.npm", "%.mozilla", "%.cache", "%node_modules"},
		},
	pickers = {
    live_grep = {
      },
		find_files = {
			find_command = {"fdfind"},
			hidden = {true},
      search_dirs = {"~/"}
			},
		}
	}
require("telescope").load_extension "file_browser"

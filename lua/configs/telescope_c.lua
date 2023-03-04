local M = {}

require('telescope').setup {
	extensions = {
		file_browser = {
			-- hijack_netrw = true,
			hidden = true,
		},
	},
	defaults = {
		file_ignore_patterns = {'%.git', '%.npm', '%node_modules'},
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

---- TELESCOPE MAPPINGS
vim.api.nvim_set_keymap('n','<leader>bb',':Telescope buffers<cr>',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>ff',':Telescope find_files<cr>',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tg',':Telescope live_grep<cr>',{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>td',':Telescope diagnostics<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>th',':Telescope help_tags<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tk',':Telescope keymaps<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tb',':Telescope file_browser path=%:p:h select_buffer=true<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tc',':Telescope colorscheme<cr>', { noremap = true, silent = true })

return M

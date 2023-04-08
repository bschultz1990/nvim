-- Is there an lspsaga in the house?
local lspsaga_ok, _ = pcall(require, 'lspsaga')
if not lspsaga_ok then
	vim.notify('lspsaga not found.', 'error')
	return
end
require('lspsaga').setup({
		lightbulb = {
			enable = false,
			enable_in_insert = false,
			sign = false,
			sign_priority = 40,
			virtual_text = false,
		},
		symbol_in_winbar = {
			enable = false,
			separator = " > ",
			hide_keyword = true,
			show_file = true,
			folder_level = 2,
			respect_root = false,
			color_mode = false,
		},
	})



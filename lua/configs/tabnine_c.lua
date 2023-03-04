local M = {}

local tabnine = require('cmp_tabnine.config')

tabnine:setup({
	max_lines = 1000,
	max_num_results = 1,
	sort = true,
	run_on_every_keystroke = false,
	snippet_placeholder = 'TN',
	ignored_file_types = {
		md = true,
		txt = true
	},
	show_prediction_strength = false
})

return M

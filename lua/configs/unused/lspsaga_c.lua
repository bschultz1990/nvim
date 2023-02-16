 	init = function()
 		local saga_ok, _ = pcall(require, 'lspsaga')
 		if not saga_ok then
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
 					separator = " ",
 					hide_keyword = true,
 					show_file = false,
 					folder_level = 2,
 					respect_root = false,
 					color_mode = false,
 				},
 			})

 		function LspKeymaps()
 			-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, {buffer=0})
 			vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { silent = true })
 			vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { buffer = 0, silent = true })
 			vim.keymap.set('n', '<leader>r', '<cmd>Lspsaga rename<CR>', { silent = true })
 			vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', { silent = true } )
 			vim.keymap.set('n','<leader>o', '<cmd>LSoutlineToggle<CR>',{ silent = true })
 			-- Show or hide diagnostic text
 			vim.diagnostic.config({ virtual_text=false })
 			-- capabilities=capabilities
 		end
 		LspKeymaps()
 	end

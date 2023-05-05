-- PLUGIN SPECIFIC KEYMAPS
vim.api.nvim_set_keymap('n','<F6>', ':Lazy<cr>', keyopts ) -- Lazy
vim.api.nvim_set_keymap('n','<leader>zz',':ZenMode<cr>', keyopts )
vim.api.nvim_set_keymap('x','ga','<Plug>(EasyAlign)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n','<leader>tr','<cmd>TroubleToggle<cr>', keyopts )
vim.api.nvim_set_keymap('n','<leader>|','<cmd>NvimTreeToggle<cr>', keyopts )

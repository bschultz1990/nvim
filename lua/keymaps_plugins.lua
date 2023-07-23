-- PLUGIN SPECIFIC KEYMAPS
vim.api.nvim_set_keymap('n','<F6>', ':Lazy<cr>', keyopts ) -- Lazy
vim.api.nvim_set_keymap('n','<leader>zz',':ZenMode<cr>', keyopts )
vim.api.nvim_set_keymap('x','ga','<Plug>(EasyAlign)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n','<leader>tr','<cmd>TroubleToggle<cr>', keyopts )
vim.api.nvim_set_keymap('n','<leader>1','<cmd>NvimTreeToggle<cr>', keyopts )
vim.api.nvim_set_keymap('n','<leader>2','<cmd>NvimTreeFocus<cr>', keyopts )

---- TELESCOPE MAPPINGS
vim.api.nvim_set_keymap('n','<leader>bb',':Telescope buffers<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>ff',':Telescope find_files<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>tg',':Telescope live_grep<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>td',':Telescope diagnostics<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>th',':Telescope help_tags<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>tk',':Telescope keymaps<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>tb',':Telescope file_browser path=%:p:h select_buffer=true<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>tc',':Telescope colorscheme<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>ta',':TagbarToggle<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>ts',':Telescope lsp_dynamic_workspace_symbols<cr>', keyopts)


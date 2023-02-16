local M = {}

vim.api.nvim_set_keymap('n', '<F7>', ':Codi!<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F8>', ':Codi<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F9>', ':CodiExpand<cr>', {noremap = true, silent = true})

return M

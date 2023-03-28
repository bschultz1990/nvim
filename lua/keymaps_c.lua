-- KEYMAPS
-- Want guidance? Me too! :h key-notation is here for you.
vim.g.mapleader = ','

vim.api.nvim_set_keymap('n','<leader>ex', ':Explore<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>H', ':lua vim.cmd("tab h " .. vim.fn.expand("<cword>"))<cr>', { noremap = true })
-- Do not yank with x
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true, nowait = true })

-- Increment, decrement
vim.api.nvim_set_keymap('n', '+', '<C-a>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '-', '<C-x>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n','<leader>q',':q<cr>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n','<F3>',':wa<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<F5>',':luafile $MYVIMRC<cr>', { noremap = true, silent = true })

-- Indents
vim.api.nvim_set_keymap('n', '<leader><Tab>', 'magg=G`azz', { noremap = true, silent = true }) -- indent on command and center the cursor

-- Center Search Results on the Page
vim.api.nvim_set_keymap('n','n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','N', 'Nzzzv', { noremap = true, silent = true })

-- Center bottom of document on page.
vim.api.nvim_set_keymap('n','G', 'Gzz', { noremap = true, silent = true })

-- FOLDS AND SUCH
vim.api.nvim_set_keymap('n','<leader>fd', ':set foldlevel=1<cr><cmd>echo "Folding..."<cr>', { noremap = true, silent = true }) -- Fold
vim.api.nvim_set_keymap('n','<leader>uf', ':set foldlevel=99<cr><cmd> echo "Unfolding..."<cr>', { noremap = true, silent = true }) -- Unfold

-- BUFFERS AND SPLITS
vim.api.nvim_set_keymap('n','<leader>n', ':bn<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>vs',':vs<cr><C-w>w', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>sp',':sp<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>w','<C-w>w<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>c','<C-w><C-c><cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>`','<cmd>sp<cr><C-w>w<cmd>terminal<cr>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tt',':tabnew<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tn',':tabnext<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tp',':tabprevious<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tx',':tabclose<cr>', { noremap = true, silent = true })

-- INSERT MODE GOODIES
vim.api.nvim_set_keymap('i','<C-Cr>','<CR><CR><Up><BS><CR>', { noremap = true, silent = true })

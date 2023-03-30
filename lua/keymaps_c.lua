-- KEYMAPS
-- Want guidance? Me too! :h key-notation is here for you.
keyopts = { noremap = true, silent = true }
vim.g.mapleader = ','

vim.api.nvim_set_keymap('n','<leader>ex', ':Explore<cr>', keyopts)
vim.api.nvim_set_keymap('n', '<leader>H', ':lua vim.cmd("tab h " .. vim.fn.expand("<cword>"))<cr>', { noremap = true })
-- Do not yank with x
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true, nowait = true })

-- Increment, decrement
vim.api.nvim_set_keymap('n', '+', '<C-a>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '-', '<C-x>', { noremap = true, silent = true, nowait = true })

vim.api.nvim_set_keymap('n','<leader>q',':q<cr>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n','<F3>',':wa<cr>', keyopts)
vim.api.nvim_set_keymap('n','<F5>',':luafile $MYVIMRC<cr>', keyopts)

-- Resize windows
vim.api.nvim_set_keymap('n','<C-w><left>','<C-w><', keyopts)
vim.api.nvim_set_keymap('n','<C-w><right>','<C-w>>', keyopts)
vim.api.nvim_set_keymap('n','<C-w><up>',':resize +5<cr>', keyopts)
vim.api.nvim_set_keymap('n','<C-w><down>',':resize -5<cr>', keyopts)

-- Indents
vim.api.nvim_set_keymap('n', '<leader><Tab>', 'magg=G`azz', keyopts) -- indent on command and center the cursor

-- Center Search Results on the Page
vim.api.nvim_set_keymap('n','n', 'nzzzv', keyopts)
vim.api.nvim_set_keymap('n','N', 'Nzzzv', keyopts)

-- Center bottom of document on page.
vim.api.nvim_set_keymap('n','G', 'Gzz', keyopts)

-- FOLDS AND SUCH
vim.api.nvim_set_keymap('n','<leader>fd', ':set foldlevel=1<cr><cmd>echo "Folding..."<cr>', keyopts) -- Fold
vim.api.nvim_set_keymap('n','<leader>uf', ':set foldlevel=99<cr><cmd> echo "Unfolding..."<cr>', keyopts) -- Unfold

-- BUFFERS AND SPLITS
vim.api.nvim_set_keymap('n','<leader>n', ':bn<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>vs',':vs<cr><C-w>w', keyopts)
vim.api.nvim_set_keymap('n','<leader>sp',':sp<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>w','<C-w>w<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>c','<C-w><C-c><cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>`','<cmd>sp<cr><C-w>w<cmd>terminal<cr>i', keyopts)
vim.api.nvim_set_keymap('n','<leader>tt',':tabnew<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>tn',':tabnext<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>tp',':tabprevious<cr>', keyopts)
vim.api.nvim_set_keymap('n','<leader>tx',':tabclose<cr>', keyopts)

-- INSERT MODE GOODIES
vim.api.nvim_set_keymap('i','<C-Cr>','<CR><CR><Up><BS><CR>', keyopts)

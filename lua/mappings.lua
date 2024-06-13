-- KEYMAPS
-- Want guidance? Me too! :h key-notation is here for you.

require "nvchad.mappings"

local map = vim.keymap.set

-- HALP
map(
  "n",
  "<leader>H",
  ':lua vim.cmd("tab h " .. vim.fn.expand("<cword>"))<cr>',
  { desc = "display help under cursor" }
)
map("n", "<leader>?", ":Telescope help_tags<cr>", { desc = "Telescope help tags" })

map('n','<M-Up>',':m-2<CR>', { desc = "Move line up" })
map('n','<M-Down>',':m+<CR>', { desc = "Move line down" })

-- Clipboard and Text Manipulation
vim.o.clipboard = ""
map("n", "x", '"_x', { noremap = true, silent = true, nowait = true }) -- Do not yank with x
map("v", "<C-c>", "\"+y", { desc = "Copy highlighted text" })
map("v", "<C-x>", "\"+d", { desc = "Cut highlighted text" })
map("n", "<C-a>", "maggVG", { desc = "Select all; Return via mark 'a' " })

-- Source current buffer
map("n", "<F5>", ":luafile %<cr>", { desc = "Source current buffer" })

-- Windows
map("n", "<leader>q", "<C-w>q", { desc = "Quit window"})
map("n", "<M-l>", "<C-w><Right>", { desc = "Window focus right" })
map("n", "<M-h>", "<C-w><Left>", { desc = "Window focus left" })
map("n", "<M-k>", "<C-w><Up>", { desc = "Window focus up" })
map("n", "<M-j>", "<C-w><Down>", { desc = "Window focus down" })


-- Tabs
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "tab close" })
map("n", "<leader>tt", ":tabnew<cr>", { desc = "tab new" })
map("n", "<leader>tn", ":tabnext<cr>", { desc = "tab next" })
map("n", "<leader>tp", ":tabprevious<cr>", { desc = "tab previous" })
map("n", "<leader>tx", ":tabclose<cr>", { desc = "tab close" })

-- Files
map("n", "<leader>rg", ":Telescope grep_string", { desc = "Grep string" })

-- Indents
map("n", "<leader><Tab>", "0magg=G`azz", { desc = "reindent buffer" })

-- -- FOLDS AND SUCH
map("n", "<leader>fd", ':set foldlevel=1<cr><cmd>echo "Folding..."<cr>', { desc = "fold" })
map("n", "<leader>uf", ':set foldlevel=99<cr><cmd> echo "Unfolding..."<cr>', { desc = "unfold" })

-- -- INSERT MODE GOODIES
map('i','<M-Cr>','<CR><CR><Up><BS><CR>', { desc = "Double-enter paragraph" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>", { desc = "save all buffers" })

-- Buffers and Splits
map('n', '<leader>bb', ':Telescope buffers<cr>', { desc = 'Telescope buffers' })
map('n', '<leader>vs', ':vs<cr>', { desc = 'Vertical split'})
map('n', '<leader>sp', ':sp<cr>', { desc = 'Horizontal split'})

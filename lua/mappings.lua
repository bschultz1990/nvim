-- KEYMAPS
-- Want guidance? Me too! :h key-notation is here for you.

require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<M-S-Right>", "<C-w>w", { desc = "Next window" })
map("n", "<M-S-Left>", "<C-w>W", { desc = "Previous window" })

map(
  "n",
  "<leader>H",
  ':lua vim.cmd("tab h " .. vim.fn.expand("<cword>"))<cr>',
  { desc = "display help under cursor" }
)
--
-- Do not yank with x
map("n", "x", '"_x', { noremap = true, silent = true, nowait = true })

-- Source current buffer
map("n", "<F5>", ":luafile %<cr>", { desc = "Source current buffer" })

-- Resize windows
map("n", "<M-Left>", ":vertical resize +2<cr>")
map("n", "<M-Right>", ":vertical resize -2<cr>")
map("n", "<M-Up>", ":resize +1<cr>")
map("n", "<M-Down>", ":resize -1<cr>")

-- Tabs
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "tab close" })
map("n", "<leader>tt", ":tabnew<cr>", { desc = "tab new" })
map("n", "<leader>tn", ":tabnext<cr>", { desc = "tab next" })
map("n", "<leader>tp", ":tabprevious<cr>", { desc = "tab previous" })
map("n", "<leader>tx", ":tabclose<cr>", { desc = "tab close" })

-- Indents
map("n", "<leader><Tab>", "0magg=G`azz", { desc = "reindent buffer" }) -- indent on command and center the cursor

-- -- FOLDS AND SUCH
map("n", "<leader>fd", ':set foldlevel=1<cr><cmd>echo "Folding..."<cr>', { desc = "fold" })
map("n", "<leader>uf", ':set foldlevel=99<cr><cmd> echo "Unfolding..."<cr>', { desc = "unfold" })
--
-- BUFFERS AND SPLITS
-- map('n','<leader>vs',':vs<cr><C-w>w')
-- map('n','<leader>sp',':sp<cr>', keyopts)
-- map('n','<leader>c','<C-w><C-c><cr>', keyopts)

-- -- INSERT MODE GOODIES
-- map('i','<C-Cr>','<CR><CR><Up><BS><CR>', keyopts)
map({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>", { desc = "save all buffers" })

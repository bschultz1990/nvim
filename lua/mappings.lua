-- KEYMAPS
-- Want guidance? Me too! :h key-notation is here for you.

require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<M-Right>", "<C-w><Right>", { desc = "Window focus right" })
map("n", "<M-Left>", "<C-w><Left>", { desc = "Window focus left" })
map("n", "<M-Up>", "<C-w><Up>", { desc = "Window focus up" })
map("n", "<M-Down>", "<C-w><Down>", { desc = "Window focus down" })

map(
  "n",
  "<leader>H",
  ':lua vim.cmd("tab h " .. vim.fn.expand("<cword>"))<cr>',
  { desc = "display help under cursor" }
)

-- Clipboard
vim.o.clipboard = ""
map("n", "x", '"_x', { noremap = true, silent = true, nowait = true }) -- Do not yank with x
map("v", "<C-c>", "\"+y", { desc = "Copy highlighted text" })

-- Source current buffer
map("n", "<F5>", ":luafile %<cr>", { desc = "Source current buffer" })

-- Resize windows
map("n", "<M-S-Left>", ":vertical resize +2<cr>")
map("n", "<M-S-Right>", ":vertical resize -2<cr>")
map("n", "<M-S-Up>", ":resize +1<cr>")
map("n", "<M-S-Down>", ":resize -1<cr>")

-- Tabs
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "tab close" })
map("n", "<leader>tt", ":tabnew<cr>", { desc = "tab new" })
map("n", "<leader>tn", ":tabnext<cr>", { desc = "tab next" })
map("n", "<leader>tp", ":tabprevious<cr>", { desc = "tab previous" })
map("n", "<leader>tx", ":tabclose<cr>", { desc = "tab close" })

-- Indents
map("n", "<leader><Tab>", "0magg=G`azz", { desc = "reindent buffer" })

-- -- FOLDS AND SUCH
map("n", "<leader>fd", ':set foldlevel=1<cr><cmd>echo "Folding..."<cr>', { desc = "fold" })
map("n", "<leader>uf", ':set foldlevel=99<cr><cmd> echo "Unfolding..."<cr>', { desc = "unfold" })

-- -- INSERT MODE GOODIES
map('i','<M-Cr>','<CR><CR><Up><BS><CR>', { desc = "Double-enter paragraph" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>", { desc = "save all buffers" })

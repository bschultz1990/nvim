vim.g.mapleader = " "
vim.keymap.set(
  "n",
  "<leader>H",
  ':lua vim.cmd("tab h " .. vim.fn.expand("<cword>"))<cr>',
  { desc = "display help under cursor" }
)


vim.keymap.set('n', '<C-l>', ':silent! lua vim.ui.open("<C-r><C-a>")<cr>:<cr>', { desc = 'Open link or file under cursor' })
vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, { desc = "Open Diagnostics in Floating Window" })

-- Clipboard
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true, nowait = true }) -- Do not yank with x
vim.keymap.set("n", "<C-S-v>", "\"+p", { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<C-S-v>", "\"+p", { desc = "Paste from system clipboard" })
vim.keymap.set("i", "<C-S-v>", "<C-r>+", { desc = "Paste from system clipboard" })

-- Lines and Selection
vim.keymap.set('n','<M-Up>',':m-2<CR>', { desc = "Move line up" })
vim.keymap.set('n','<M-Down>',':m+<CR>', { desc = "Move line down" })
vim.keymap.set("n", "<C-c>", "\"+yy", { desc = "Copy current line" })
vim.keymap.set("v", "<C-c>", "\"+y", { desc = "Copy highlighted text" })
vim.keymap.set("n", "<leader><C-x>", "\"+dd", { desc = "Cut current line" })
vim.keymap.set("v", "<leader><C-x>", "\"+d", { desc = "Cut highlighted text" })
vim.keymap.set("n", "<leader><C-a>", "maggVG", { desc = "Select all; Return via mark 'a' " })


-- Yes, we need both of these so this will work in terminal and Neovide
vim.keymap.set("i", "<C-h>", "<C-w>", { desc = "Delete word" })
vim.keymap.set("i", "<C-BS>", "<C-w>", { desc = "Delete word" })
vim.keymap.set("t", "<Esc-Esc>", "<C-\\><C-N>", { desc = "Escape Terminal Mode" })
vim.keymap.set("n", "<M-i>", function() vim.cmd("terminal") vim.cmd("startinsert") end,
  { desc = "Enter Terminal Mode" })


-- Center search results on the page
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Center next search result" })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Center previous search result" })


-- Windows and tabs
vim.keymap.set("n", "<leader>q", "<C-w>q", { desc = "Quit window"})

vim.keymap.set("n", "<leader><Right>", "<C-w><Right>", { desc = "Window focus right" })
vim.keymap.set("n", "<leader><Left>", "<C-w><Left>", { desc = "Window focus left" })
vim.keymap.set("n", "<leader><Up>", "<C-w><Up>", { desc = "Window focus up" })
vim.keymap.set("n", "<leader><Down>", "<C-w><Down>", { desc = "Window focus down" })

vim.keymap.set("n", "<leader>l", "<C-w><Right>", { desc = "Window focus right" })
vim.keymap.set("n", "<leader>h", "<C-w><Left>", { desc = "Window focus left" })
vim.keymap.set("n", "<leader>k", "<C-w><Up>", { desc = "Window focus up" })
vim.keymap.set("n", "<leader>j", "<C-w><Down>", { desc = "Window focus down" })


-- Tabs
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "tab close" })
vim.keymap.set("n", "<leader>tt", ":tabnew<cr>", { desc = "tab new" })
vim.keymap.set("n", "<leader>tn", ":tabnext<cr>", { desc = "tab next" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<cr>", { desc = "tab previous" })
vim.keymap.set("n", "<leader>tx", ":tabclose<cr>", { desc = "tab close" })


-- Files and Telescope
vim.keymap.set("n", "<leader>?", ":Telescope help_tags<cr>", { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>tk", ":Telescope keymaps<cr>", { desc = "Telescope keymaps" })
vim.keymap.set("i", "<C-;>", "<cmd>Telescope symbols<cr>", { desc = "Telescope symbols" })

vim.keymap.set("n", "<leader>rg", ":Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>", { desc = "Old Files" })

if package.loaded['mini.files'] then
  vim.keymap.set("n", "-", ":lua MiniFiles.open()<cr>", { desc = "Open files" })
end


-- FOLDS AND SUCH
vim.keymap.set("n", "<leader>fd", ':set foldlevel=1<cr><cmd>echo "Folding..."<cr>', { desc = "fold" })
vim.keymap.set("n", "<leader>uf", ':set foldlevel=99<cr><cmd> echo "Unfolding..."<cr>', { desc = "unfold" })


-- INSERT MODE GOODIES
vim.keymap.set('i','<F2>','<CR><CR><Up><BS><CR>', { desc = "Double-enter paragraph" })
vim.keymap.set('n','<F2>','i<CR><CR><Up><BS><CR>', { desc = "Double-enter paragraph" })
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>", { desc = "save all buffers" })


-- Buffers and Splits
vim.keymap.set("n", "<leader>bb", ":Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>x", ":bd<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<Tab>", ":bn<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":bp<cr>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<F5>", ":luafile %<cr>", { desc = "Source current buffer" })
vim.keymap.set("n", "<leader><Tab>", "0magg=G`azz", { desc = "reindent buffer" })

vim.keymap.set('n', '<leader>vs', ':vs<cr>', { desc = 'Vertical split'})
vim.keymap.set('n', '<leader>sp', ':sp<cr>', { desc = 'Horizontal split'})

local map = vim.keymap.set


vim.g.mapleader = " "
map(
  "n",
  "<leader>H",
  ':lua vim.cmd("tab h " .. vim.fn.expand("<cword>"))<cr>',
  { desc = "display help under cursor" }
)


map('n', '<C-l>', ':silent! lua vim.ui.open("<C-r><C-a>")<cr>:<cr>', { desc = 'Open link or file under cursor' })

map("n", "x", '"_x', { noremap = true, silent = true, nowait = true }) -- Do not yank with x
map('n','<M-Up>',':m-2<CR>', { desc = "Move line up" })
map('n','<M-Down>',':m+<CR>', { desc = "Move line down" })
map("n", "<C-c>", "\"+yy", { desc = "Copy current line" })
map("v", "<C-c>", "\"+y", { desc = "Copy highlighted text" })
map("n", "<C-S-v>", "\"+p", { desc = "Paste from system clipboard" })
map("v", "<C-S-v>", "\"+p", { desc = "Paste from system clipboard" })
map("i", "<C-S-v>", "<C-r>+", { desc = "Paste from system clipboard" })
map("n", "<leader><C-x>", "\"+dd", { desc = "Cut current line" })
map("v", "<leader><C-x>", "\"+d", { desc = "Cut highlighted text" })
map("n", "<leader><C-a>", "maggVG", { desc = "Select all; Return via mark 'a' " })


-- Yes, we need both of these so this will work in terminal and Neovide
map("i", "<C-h>", "<C-w>", { desc = "Delete word" })
map("i", "<C-BS>", "<C-w>", { desc = "Delete word" })
map("t", "<Esc>", "<C-\\><C-N>", { desc = "Escape terminal mode" })


-- Snippets
map("n", "<leader><leader>s", function()
  local config_path = vim.fn.stdpath('config')
  local snippet_path = vim.fn.expand(config_path .. "/lua/user/snippets")
  require("luasnip.loaders.from_snipmate").load(snippet_path)
  -- require("luasnip.loaders.from_vscode").load({paths = { snippet_path }})
  print("✨ Snippets reloaded ✨")
end)


-- Center search results on the page
map('n', 'n', 'nzzzv', { desc = "Center next search result" })
map('n', 'N', 'Nzzzv', { desc = "Center previous search result" })


-- Windows
map("n", "<leader>q", "<C-w>q", { desc = "Quit window"})

map("n", "<leader><Right>", "<C-w><Right>", { desc = "Window focus right" })
map("n", "<leader><Left>", "<C-w><Left>", { desc = "Window focus left" })
map("n", "<leader><Up>", "<C-w><Up>", { desc = "Window focus up" })
map("n", "<leader><Down>", "<C-w><Down>", { desc = "Window focus down" })

map("n", "<leader>l", "<C-w><Right>", { desc = "Window focus right" })
map("n", "<leader>h", "<C-w><Left>", { desc = "Window focus left" })
map("n", "<leader>k", "<C-w><Up>", { desc = "Window focus up" })
map("n", "<leader>j", "<C-w><Down>", { desc = "Window focus down" })


-- Tabs
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "tab close" })
map("n", "<leader>tt", ":tabnew<cr>", { desc = "tab new" })
map("n", "<leader>tn", ":tabnext<cr>", { desc = "tab next" })
map("n", "<leader>tp", ":tabprevious<cr>", { desc = "tab previous" })
map("n", "<leader>tx", ":tabclose<cr>", { desc = "tab close" })


-- Files and Telescope
map("n", "<leader>?", ":Telescope help_tags<cr>", { desc = "Telescope help tags" })
map("n", "<leader>tk", ":Telescope keymaps<cr>", { desc = "Telescope keymaps" })
map("i", "<C-;>", "<cmd>Telescope symbols<cr>", { desc = "Telescope symbols" })

map("n", "<leader>rg", ":Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fo", ":Telescope oldfiles<cr>", { desc = "Old Files" })

if package.loaded['mini.files'] then
  map("n", "-", ":lua MiniFiles.open()<cr>", { desc = "Open files" })
end


-- FOLDS AND SUCH
map("n", "<leader>fd", ':set foldlevel=1<cr><cmd>echo "Folding..."<cr>', { desc = "fold" })
map("n", "<leader>uf", ':set foldlevel=99<cr><cmd> echo "Unfolding..."<cr>', { desc = "unfold" })


-- INSERT MODE GOODIES
map('i','<F2>','<CR><CR><Up><BS><CR>', { desc = "Double-enter paragraph" })
map('n','<F2>','i<CR><CR><Up><BS><CR>', { desc = "Double-enter paragraph" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> wa <cr>", { desc = "save all buffers" })


-- Buffers and Splits
map("n", "<leader>bb", ":Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>x", ":bd<cr>", { desc = "Delete buffer" })
map("n", "<Tab>", ":bn<cr>", { desc = "Next Buffer" })
map("n", "<S-Tab>", ":bp<cr>", { desc = "Previous Buffer" })
map("n", "<F5>", ":luafile %<cr>", { desc = "Source current buffer" })
map("n", "<leader><Tab>", "0magg=G`azz", { desc = "reindent buffer" })

map('n', '<leader>vs', ':vs<cr>', { desc = 'Vertical split'})
map('n', '<leader>sp', ':sp<cr>', { desc = 'Horizontal split'})

-- more here: https://github.com/neovim/nvim-lspconfig/tree/master/lsp

vim.lsp.enable('pyright')

-- dynamically load files in lsps directory
vim.cmd('runtime! lua/pluginconfigs/lsps/*.lua')

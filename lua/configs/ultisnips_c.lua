-- keymaps
vim.g.UltiSnipsExpandTrigger = "<Tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"

-- normal, tabdo, horizontal, vertical, context
vim.g.UltiSnipsEditSplit = "context"
vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "snippets_custom" }

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' },{
    pattern = "*.snippets",
    command = 'setfiletype snippets'
  })


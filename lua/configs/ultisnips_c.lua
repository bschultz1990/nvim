-- keymaps
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
-- FIXME: JumpBackwardsTrigger with shift-tab
-- vim.g.UltiSnipsJumpBackwardTrigger = "<s><tab>"

vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "snippets_custom" }

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' },{
    pattern = "*.snippets",
    command = 'setfiletype snippets'
  })


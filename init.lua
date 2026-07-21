vim.g.mapleader = " "

vim.keymap.set('n', '<leader>rr', function() vim.cmd('restart') end, { desc = "Restart Neovim" })


-- KEYBINDS: Plugins
vim.keymap.set('n', '<leader>pu', function() vim.pack.update() end, { desc = "Update plugins" })
vim.keymap.set('n', '<leader>ps', function() vim.cmd('checkhealth vim.pack') end, { desc = "View plugin diagnostics" })

vim.api.nvim_create_autocmd('LspAttach' ,{
    callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/codeAction') then
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action(), { buffer = ev.buf })
    end
    -- if client:supports_method('textDocument/hover')
end,
})



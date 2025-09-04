return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  config = function ()
    local ls = require("luasnip")

    vim.keymap.set({"i"}, "<C-y>", function() ls.expand() end, {silent = true})
    -- vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump( 1) end, {silent = true})
    -- vim.keymap.set({"i", "s"}, "<C-K>", function() ls.jump(-1) end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})

    -- Snippet Reloading
    vim.keymap.set('n', '<leader><leader>s', function()
      local config_path = vim.fn.stdpath('config')
      local snippet_path = vim.fn.expand(config_path .. '/snippets')
      -- require("luasnip.loaders.from_snipmate").load({ paths = { snippet_path } })
      require("luasnip").cleanup() -- Clear all snippets
      -- require("luasnip.loaders.from_vscode").load({paths = { snippet_path }})
      require("luasnip.loaders.from_vscode").lazy_load()
      -- require('luasnip.loaders').reload_file(snippet_path)
      print('✨ Snippets reloaded from ' ..snippet_path.." ✨")
    end)



  end
}

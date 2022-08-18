-- Do we have an lspconfig in the building?
local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then return end
----------------------------------------
-- connect to servers
-- read more at :h vim.lsp.buf<TAB>
-- Need more servers?
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
----------------------------------------

Servers = {'tsserver', 'sumneko_lua'}

for i, lsp in ipairs(Servers) do
  require('lspconfig')[lsp].setup{
  on_attach = function()
    print(lsp..' ATTACHED! :D')
    nmap('<C-k>','vim.lsp.buf.hover')
    nmap('gd','vim.lsp.buf.definition')
    nmap('gD','vim.lsp.buf.declaration')
    nmap('<leader>r','vim.lsp.buf.rename')
    nmap('gr','vim.lsp.buf.references')

    if (lsp == 'sumneko_lua') then
      local settings = {
	Lua = {
	  runtime = {
	    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
	    version = 'LuaJIT',
	  },
	  diagnostics = {
	    -- Get the language server to recognize the `vim` global
	    globals = {'vim',},
	  },
	  workspace = {
	    -- Make the server aware of Neovim runtime files
	    library = vim.api.nvim_get_runtime_file("", true),
	  },
	  telemetry = {enable = false,},
	},
      }
    end

  end
  }
end

-- Is there an lspconfig in the house?
local lspconfig_ok, _ = pcall(require, 'lspconfig')
if not lspconfig_ok then
	vim.notify('lspconfig not found.', 'error')
	return
end

local configs = require('lspconfig/configs')
----------CONNECT TO SERVERS------------
-- read more at :h vim.lsp.buf<TAB>
-- Need more servers?
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
----------------------------------------
-- WARNING! SERVERS MUST BE EITHER LISTED HERE, OR BELOW WITH SPECIFIC
-- CONFIGS. NEVER IN BOTH PLACES.
Unconfigured_servers = {
}
for index, lsp in ipairs(Unconfigured_servers) do
	require('lspconfig')[lsp].setup{}
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

function LspKeymaps()
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.references, { buffer = 0 })
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = 0, silent = true })
	vim.keymap.set('n', 'gD', vim.lsp.buf.definition, { buffer = 0, silent = true })
	vim.keymap.set('n', '<leader>r', vim.lsp.util.rename, { silent = true })
	-- -- Show or hide diagnostic text
	vim.diagnostic.config({ virtual_text=false })
	capabilities=capabilities
end

-----------JSON-----------
-----------EMMET-----------
require('lspconfig').emmet_ls.setup {
	on_attach = function()
		print('emmet_ls attached')
	end,
	filetypes = {
		'html',
		'typescriptreact',
		'javascriptreact',
		'css',
		'sass',
		'scss',
		'less',
		'jst'
	},
}

-------------SHELLCHECK-----------
-- Shh! This file doesn't know this code isn't an lspconfig server
-- We're sneaking it in!
vim.api.nvim_create_autocmd('FileType', {
		pattern = { 'sh', 'zsh' },
		callback = function()
			vim.lsp.start({
					name = 'bash-language-server',
					cmd = { 'bash-language-server', 'start' },
				})
		end,
	})
-----------CSSLS-----------
require'lspconfig'.cssls.setup {
	on_attach = function ()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		LspKeymaps()
		print ('cssls attached!')
	end,
}

------------LUA-LS----------
require'lspconfig'.lua_ls.setup {
	on_attach = function()
		LspKeymaps()
		print('lua_ls attached')
	end,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	}
}


--------------TSSERVER--------------
require('lspconfig').tsserver.setup{
	on_attach = function ()
		LspKeymaps()
		print('tsserver attached')
	end
}

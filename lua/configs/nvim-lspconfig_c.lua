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
-- WARNING! SERVERS MUST BE EITHER LISTED IN Unconfigured_servers, OR BELOW WITH SPECIFIC CONFIGS. 
-- NEVER PUT THEM IN BOTH PLACES.
Unconfigured_servers = {
}
for index, lsp in ipairs(Unconfigured_servers) do
	require('lspconfig')[lsp].setup{}
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

function LspKeymaps()
	local references = vim.lsp.buf.references
	local declaration = vim.lsp.buf.declaration
	-- local definition = vim.lsp.buf.definition
	-- local rename = vim.lsp.buf.rename

	-- Is there an lspconfig in the house?
	local lspconfig_ok, _ = pcall(require, 'lspconfig')
	if not lspconfig_ok then
		vim.notify('lspconfig not found.', 'error')
		return
	end
	
	-- Hide all semantic highlights
	for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
		vim.api.nvim_set_hl(0, group, {})
	end


	-- local references = 
	-- local declaration = 
	local definition = "<cmd>Lspsaga peek_definition<cr>"
	local rename = "<cmd>Lspsaga rename ++project<cr>"

	vim.keymap.set('n', '<C-k>', references, { buffer = 0 })
	vim.keymap.set('n', 'gD', declaration, { buffer = 0, silent = true })
	vim.keymap.set('n', 'gD', definition, { buffer = 0, silent = true })
	vim.keymap.set('n', '<leader>r', rename, { silent = true })
	-- -- Show or hide diagnostic text
	vim.diagnostic.config({ virtual_text=true })
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
		'jst',
		'ejs'
	},
}

-------------SHELLCHECK-----------
-- Shh! This config file doesn't know that the following autocommand isn't a real lspconfig server.
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
			semantic = {
				hightlight = false,
			},
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

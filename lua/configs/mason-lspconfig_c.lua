-- Set up Mason first.
require('mason').setup()
require('mason-lspconfig').setup({
		automatic_installation = true
	})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.diagnostic.config({ virtual_text=true })

function LspKeymaps()
	-- Hide all semantic highlights
	for _, group in ipairs(vim.fn.getcompletion('@lsp', 'highlight')) do
		vim.api.nvim_set_hl(0, group, {})
	end
	local references = vim.lsp.buf.references
	local declaration = vim.lsp.buf.declaration
	-- local definition = vim.lsp.buf.definition
	-- local rename = vim.lsp.buf.rename
	local definition = ':Lspsaga peek_definition<cr>'
	-- local rename = ':Lspsaga lsp_rename ++project<cr>'
	local rename = "<cmd>Lspsaga rename ++project<cr>"

	vim.keymap.set('n', '<C-k>', references, { buffer = 0 })
	vim.keymap.set('n', 'gD', declaration, { buffer = 0, silent = true })
	vim.keymap.set('n', 'gD', definition, { buffer = 0, silent = true })
	vim.keymap.set('n', '<leader>r', rename, { silent = true })
	capabilities=capabilities
end

LspKeymaps()

require('mason-lspconfig').setup_handlers {
	function(server)
		require('lspconfig')[server].setup({
				on_attach = function()
					print(server,' is attached!')
				end
			})
	end,

	-- FIXME:
	-- ['lua_ls'] = function()
	-- 	require('lspconfig').lua_ls.setup ({
	-- 			on_attach = function()
	-- 				print('lua_ls - custom config attached!')
	-- 			end, --on_attach
	-- 			settings = {
	-- 				Lua = {
	-- 					semantic = { hightlight = false },
	-- 					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
	-- 					runtime = { version = 'LuaJIT' },
	-- 					-- Get the language server to recognize the `vim` global
	-- 					diagnostics = { globals = { 'vim' } },
	-- 					workspace = {
	-- 						library = vim.api.nvim_get_runtime_file('', true),
	-- 						checkThirdParty = false,
	-- 					},
	-- 					telemetry = { enable = false },
	-- 				},
	-- 			}
	-- 		}) -- lua_ls.setup

	-- end -- lua_ls - Mason
} -- mason-lspconfig.setup_handlers

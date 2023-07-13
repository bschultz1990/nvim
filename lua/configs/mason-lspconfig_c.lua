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
	local definition = ''
	-- local definition = vim.lsp.buf.definition
	local rename = vim.lsp.buf.rename
	-- local rename = "<cmd>lua require'lspactions'.rename()<cr>"

	vim.keymap.set('n', '<C-k>', references, { buffer = 0 })
	-- vim.keymap.set('n', 'gD', definition, { buffer = 0, silent = true })
	vim.keymap.set('n', 'gD', declaration, { buffer = 0, silent = true })
	vim.keymap.set('n', '<leader>r', rename, { buffer = 0 })

end


require('mason-lspconfig').setup_handlers {
	function(server)
		require('lspconfig')[server].setup({
				capabilities = capabilities,
				on_attach = function()
					print(server,' is attached!')
					LspKeymaps()
				end
			})
	end,

	-- ['lua_ls'] = function()
	-- 	require("lspconfig").lua_ls.setup {
	-- 		capabilities=capabilities,
	-- 		on_attach = function()
	-- 			LspKeymaps()
	-- 		end,
	-- 		settings = {
	-- 			Lua = {
	-- 				semantic = { hightlight = false, },
	-- 				runtime = { version = 'LuaJIT', },
	-- 				diagnostics = { globals = { 'vim' }, },
	-- 				workspace = {
	-- 					library = vim.api.nvim_get_runtime_file('', true),
	-- 					checkThirdParty = false,
	-- 				},
	-- 				telemetry = { enable = false },
	-- 			},
	-- 		}
	-- 	}
	-- end -- lua_ls - Mason

} -- mason-lspconfig.setup_handlers

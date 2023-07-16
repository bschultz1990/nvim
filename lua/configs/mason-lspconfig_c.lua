require('mason').setup() -- Set up Mason first
require('mason-lspconfig').setup({
		automatic_installation = true
	})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.diagnostic.config({ virtual_text=true })

-- Hide all semantic highlights
for _, group in ipairs(vim.fn.getcompletion('@lsp', 'highlight')) do
	vim.api.nvim_set_hl(0, group, {})
end

function LspKeymaps()
	-- local definition = vim.lsp.buf.definition
	-- local rename = vim.lsp.buf.rename
	-- local declaration = vim.lsp.buf.declaration
	local definition = "<cmd>lua require'lspactions'.definition()<cr>"
	local declaration = "<cmd>lua require'lspactions'.declaration()<cr>"
	local references = vim.lsp.buf.references
	local rename = "<cmd>lua require'lspactions'.rename()<cr>"

	vim.keymap.set('n', '<C-k>', references, { buffer = 0 })
	vim.keymap.set('n', '<leader>gd', definition, { buffer = 0, silent = true })
	vim.keymap.set('n', '<leader>gD', declaration, { buffer = 0, silent = true })
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

	lua_ls = function()
		require("lspconfig").lua_ls.setup {
			capabilities=capabilities,
			on_attach = function()
				LspKeymaps()
			end,
			settings = {
				Lua = {
					runtime = { version = 'LuaJIT', },
					diagnostics = { globals = { 'vim', 'lspactions' }, },
					telemetry = { enable = false },
				}, -- Lua
			}, -- settings
		} -- setup
	end, -- lua_ls

	emmet_ls = function()
		require("lspconfig").emmet_ls.setup {
			capabilities = capabilities,
			on_attach = function()
				LspKeymaps()
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
			}, --filetypes
		} -- setup
	end -- emmet_ls

} -- mason-lspconfig.setup_handlers

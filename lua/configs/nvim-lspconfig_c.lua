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
Unconfigured_servers = {
}
for index, lsp in ipairs(Unconfigured_servers) do
	require('lspconfig')[lsp].setup{}
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

function LspKeymaps()
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, {buffer=0})
	vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { silent = true })
	vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', { buffer = 0, silent = true })
	vim.keymap.set('n', '<leader>r', '<cmd>Lspsaga rename<CR>', { silent = true })
	vim.keymap.set('n', '<leader>d', '<cmd>Lspsaga show_line_diagnostics<CR>', { silent = true } )
	vim.keymap.set('n','<leader>o', '<cmd>LSoutlineToggle<CR>',{ silent = true })
	-- Show or hide diagnostic text
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

-----------SHELLCHECK-----------
require'lspconfig'.shellcheck.setup {
	on_attach = function()

	end
}

-----------CSSLS-----------
require'lspconfig'.cssls.setup {
	on_attach = function ()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		LspKeymaps()
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.references, { buffer = 0 })
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


--------------TABNINE---------------
local tabnine = require('cmp_tabnine.config')

tabnine:setup({
		max_lines = 1000,
		max_num_results = 3,
		sort = true,
		run_on_every_keystroke = true,
		snippet_placeholder = '...',
		ignored_file_types = {
			-- default is not to ignore
			-- uncomment to ignore in lua:
			-- lua = true
		},
		show_prediction_strength = false
	})
--------------NVIM-CMP--------------
-- Setup nvim-cmp.
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require'cmp'
local lspkind = require('lspkind')
cmp.setup({
		formatting = {
			format = lspkind.cmp_format ({
					mode = 'symbol',
					maxwidth = 50,
					ellipsis_char = '...'
				})
		},
		snippet = {
			expand = function(args)
				-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
				vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<Tab>'] = cmp.mapping.confirm({
						select = true,
						behavior = cmp.ConfirmBehavior.Insert,
					}),
			}),
		sources = cmp.config.sources({
				{ name = 'nvim_lsp', keyword_length=1 },
				{ name = 'emmet_ls', keyword_length=1 },
				{ name = 'vsnip', keyword_length=3 }, -- vsnip, ultisnips, snippy, luasnip 
				{ name = 'cmp_tabnine', keyword_length=3 },
				{ name = 'nvim_lua', keyword_length=3 },
				{ name = 'path', keyword_length=3 },
				-- { name = 'buffer', keyword_length=3 },
			}),
		view = {
			entries = "native"
		},
		experimental = {
			ghost_text = false,
		}
	})

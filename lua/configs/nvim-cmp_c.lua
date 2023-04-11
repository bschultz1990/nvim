--------------NVIM-CMP--------------
-- Setup nvim-cmp.
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require'cmp'
local lspkind = require('lspkind')
cmp.setup({
		formatting = {
			format = lspkind.cmp_format ({
					mode = 'symbol_text',
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
				{ name = 'nvim_lsp', keyword_length=2 },
				{ name = 'emmet_ls', keyword_length=2 },
				{ name = 'ultisnips', keyword_length=2 }, -- vsnip, ultisnips, snippy, luasnip 
				{ name = 'codeium', keyword_length=2 },
				-- { name = 'cmp_tabnine', keyword_length=3 },
				{ name = 'nvim_lua', keyword_length=3 },
				{ name = 'path', keyword_length=3 },
				-- { name = 'buffer', keyword_length=3 },
			}),
		view = {
			entries = "native"
		},
		experimental = {
			ghost_text = true,
		}
	})

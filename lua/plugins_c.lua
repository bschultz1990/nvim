local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
end
vim.opt.rtp:prepend(lazypath)

-- KEYMAPS
vim.g.mapleader = ','

require("lazy").setup({
		{ 'windwp/nvim-autopairs',
			init = function() require('configs.nvim-autopairs_c')	end
		},
		{ "akinsho/bufferline.nvim",
			version = "v3.*",
			depends = { "kyazdani42/nvim-web-devicons"},
			init = function () require ('configs.bufferline_c') end
		},
		{ "echasnovski/mini.bufremove",
			keys = {
				{ "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
				{ "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
			},
		},
		{ 'tpope/vim-surround'},
		{ 'tpope/vim-commentary'},
		{ 'tpope/vim-repeat'},
		{ 'folke/zen-mode.nvim'},
		{ 'folke/twilight.nvim'},
		{ 'junegunn/vim-easy-align'},
		{ 'rcarriga/nvim-notify'},
		{ 'nvim-treesitter/nvim-treesitter',
			cmd = 'TSUpdate',
			lazy = false,
			init = function () require ('configs.nvim-treesitter_c') end
		},
		{ 'kyazdani42/nvim-web-devicons' },
		{ 'nvim-lualine/lualine.nvim',
			init = function() require ('configs.lualine_c') end
		},
		{ 'nvim-telescope/telescope.nvim',
			dependencies = {
				'nvim-lua/popup.nvim',
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope-file-browser.nvim'
			},
			init = function () require('configs.telescope_c')	end
		},
		{ 'ap/vim-css-color'},
		{ 'marko-cerovac/material.nvim',
			priority = 9000,
			init = function() require ('configs.material_c') end
		},
		{ 'ghifarit53/tokyonight-vim',
			init = function() require ('configs.tokyonight_c') end
		},
		{ 'sainnhe/sonokai',
			init = function() require ('configs.sonokai_c') end
		},
		{ 'shaunsingh/nord.nvim'},
		{ 'EdenEast/nightfox.nvim'},
		{ 'sheerun/vim-polyglot'},
		{ 'norcalli/nvim-colorizer.lua' },
		{ 'KabbAmine/vCoolor.vim' },
		{ 'echasnovski/mini.starter',
			version = false, -- wait till new 0.7.0 release to put it back on semver
			event = "VimEnter",
			init = function() require('configs.lazyvim_c') end
		},
		{ 'catppuccin/nvim', name = "catppuccin" },
		{ 'metakirby5/codi.vim',
			init = function() require('configs.codi_c') end
		},
		{ 'overcache/NeoSolarized' },
		-- { 'codota/tabnine-nvim',
		-- 	build = './dl_binaries.sh',
		-- 	init = function () require('configs.tabnine_c') end
		-- },
		-- { 'neoclide/coc.nvim',
		-- 	branch = 'release',
		-- 	init = function() require('configs.coc_c') end
		-- },

		--------------------------------------------------------------
		-- Nvim CMP Setup
		--------------------------------------------------------------
		{ 'RishabhRD/lspactions',
		},
		-- { 'glepnir/lspsaga.nvim',
		-- 	init = function() require ('configs.lspsaga_c') end
		-- },
		{ 'hrsh7th/nvim-cmp',
			dependencies = {
				'hrsh7th/cmp-nvim-lua',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline',
				'quangnguyen30192/cmp-nvim-ultisnips'
			}
		},
		{ 'tzachar/cmp-tabnine',
			build = './install.sh',
			event = 'VimEnter'
		},
		{ 'williamboman/mason.nvim',
			init = function () require('mason').setup() end
		},
		{ 'williamboman/mason-lspconfig.nvim',
			event = 'VimEnter',
			init = function()
			require("mason-lspconfig").setup({ automatic_installation = true, }) end
		},
		{ 'neovim/nvim-lspconfig',
			event = 'VimEnter',
			dependencies = 'onsails/lspkind.nvim',
			init = function() require('configs.nvim-lspconfig_c') end
		},
		{ 'folke/trouble.nvim',
			event = 'VimEnter',
			depends = { "kyazdani42/nvim-web-devicons"},
			init = function () require('configs.trouble_c') end
		},
		{ 'mfussenegger/nvim-dap',
		},
		-- SNIPPETS --
		{ 'sirver/ultisnips',
			dependencies = {
				'honza/vim-snippets',
			},
			init = function () require('configs.ultisnips_c') end
		},

		-- { 'hrsh7th/vim-vsnip',
		-- 	event = 'VimEnter',
		-- 	dependencies = {
		-- 		'rafamadriz/friendly-snippets',
		-- 	}
		-- },
		--------------------------------------------------------------
		-- END Nvim CMP Setup
		--------------------------------------------------------------
	})

-- MIGRATION FROM PACKER
-- setup => init
-- requires => dependencies
-- as => name
-- opt => lazy
-- run => build
-- lock => pin
-- disable=true => enabled = false
-- tag='*' => version="*"
-- after information_source not needed for most use-cases. Use dependencies otherwise.
-- wants information_source not needed for most use-cases. Use dependencies otherwise.
-- config don't support string type, use fun(LazyPlugin) instead.
-- module is auto-loaded. No need to specify



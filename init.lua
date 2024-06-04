require('functions')
require('base')
require('keymaps')
require('keymaps_plugins')


vim.cmd([[
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'windwp/nvim-autopairs'
Plug 'sainnhe/sonokai'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'elihunter173/dirbuf.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

nnoremap ga = <Plug>(EasyAlign)
]])

-- Plenary setup:
local async = require "plenary.async"


--Telescope Setup
--Live grep from project git root with fallback:
function live_grep_from_project_git_root()
	local function is_git_repo()
		vim.fn.system("git rev-parse --is-inside-work-tree")

		return vim.v.shell_error == 0
	end

	local function get_git_root()
		local dot_git_path = vim.fn.finddir(".git", ".;")
		return vim.fn.fnamemodify(dot_git_path, ":h")
	end

	local opts = {}

	if is_git_repo() then
		opts = {
			cwd = get_git_root(),
		}
	end

	require("telescope.builtin").live_grep(opts)
end


-- Find Files from Project Git Root with Fallback
-- find_files combined with git_files
-- Finds files regardless of your current directory as long as you're in the project directory.
function vim.find_files_from_project_git_root()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
end


-- Colorscheme Assignment
local ok, _ = pcall(vim.cmd, 'colorscheme sonokai')
if not ok then
        vim.cmd 'colorscheme default' -- if the above fails, then use default
end

-- Experimental
--require('test')

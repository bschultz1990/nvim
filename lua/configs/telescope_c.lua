local M = {}

require('telescope').setup {
	extensions = {
		file_browser = {
			-- hijack_netrw = true,
			hidden = true,
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown {

			},
		},
	},
	defaults = {
		file_ignore_patterns = {'%.git', '%.npm', '%node_modules', '^go/', '^src/'},
		layout_strategy = 'vertical',
		layout_config = {
			height = 125,
		}
	},
	pickers = {
		find_files = {
			hidden = true
			-- find_command = {'fzf'},
		},
		colorscheme = {
			enable_preview = true
		}
	}
}

-- Live grep from project git root with fallback
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

-- Find files from project git root with fallback
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

-- Load Extra Extensions
require("telescope").load_extension "file_browser"
require("telescope").load_extension "ui-select"
return M

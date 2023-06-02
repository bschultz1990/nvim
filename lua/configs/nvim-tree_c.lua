require("nvim-tree").setup({
		view = { width = 30, },
		filters = { dotfiles = true, },
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		reload_on_bufenter = true
	})

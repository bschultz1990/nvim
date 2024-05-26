local logo = table.concat({
		"██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
		"██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z",
		"██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z",
		"██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z",
		"███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
		"╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
	}, "\n")
local pad = string.rep(" ", 22)
local new_section = function(name, action, section)
	return { name = name, action = action, section = pad .. section }
end

local config = {
	evaluate_single = true,
	header = logo,
	items = {
		new_section("Find file",    "Telescope find_files", "Telescope"),
		new_section("Recent files", "Telescope oldfiles",   "Telescope"),
		new_section("Grep text",    "Telescope live_grep",  "Telescope"),
		new_section("init.lua",     "e $MYVIMRC",           "Config"),
		new_section("Plugins",":edit ~/.config/nvim/lua/plugins.lua", "Config"),
		new_section("Lazy",         "Lazy",                 "Config"),
		new_section("Sessions",     ":Explore ~/.config/nvim/sessions/",    "Bookmarks"),
		new_section("New file",     "ene | startinsert",    "Built-in"),
		new_section("Quit",         "qa",                   "Built-in"),
	},
	content_hooks = {
		require("mini.starter").gen_hook.adding_bullet(pad .. "░ ", false),
		require("mini.starter").gen_hook.aligning("center", "center"),
	},
}

-- close Lazy and re-open when starter is ready
if vim.o.filetype == "lazy" then
	vim.cmd.close()
	vim.api.nvim_create_autocmd("User", {
			pattern = "MiniStarterOpened",
			callback = function()
				require("lazy").show()
			end,
		})
end

require("mini.starter").setup(config)

vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			local pad_footer = string.rep(" ", 8)
			require("mini.starter").config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
			pcall(require("mini.starter").refresh)
		end,
	})

-- Start mini.starter with a key combo
vim.api.nvim_set_keymap('n','<leader>st', ':lua MiniStarter.open()<cr>', { noremap = true, silent = true })

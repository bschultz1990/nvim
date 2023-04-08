-- Is there an neosolarized in the house?
local neosolarized_ok, _ = pcall(require, 'neosolarized')
if not neosolarized_ok then
	vim.notify('neosolarized not found.',error)
	return
end

require ("neosolarized").setup({
		commit_italics = true
	})

local colorbuddy = require('colorbuddy.init')
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

Color.new('black', '#000000')
-- Group.new('Cursorline',
-- 	colors.none,
-- 	colors.base03,
-- 	styles.NONE,
-- 	colors.base1)

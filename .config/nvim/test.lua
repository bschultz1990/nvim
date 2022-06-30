-- Silent binds with cmdheight=0
function SilentBind(cmd)
	vim.cmd([[
	set cmdheight=1
	echo a:cmd
	set cmdheight=0
	]])
end

-- Silent Binds with cmdheight=0

-- function! SilentBind(Command) abort
-- set cmdheight=1
-- a:Command
-- set cmdheight=0
-- return
-- endfunction


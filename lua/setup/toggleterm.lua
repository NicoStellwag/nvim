local toggleterm = require('toggleterm')
local Terminal = require('toggleterm.terminal').Terminal

-- nmake terminal
local nmake_cmd = [[
	powershell.exe -NoExit -Command "&{Import-Module """C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"""; Enter-VsDevShell 0638fbdc -SkipAutomaticLocation -DevCmdArguments """-arch=x64 -host_arch=x64"""; nmake}"
]]
function _NMAKE_TOGGLE()
	local curr_dir = vim.api.nvim_buf_get_name(0):match("(.*[/\\])")
	if curr_dir == nil then
		return
	end
	local nmake_term = Terminal:new({
		direction = 'float',
		cmd = nmake_cmd,
		dir = curr_dir
	})
	nmake_term:toggle()
end

-- general config
local options = {
	direction = 'float'
}
if vim.fn.has('win32unix') then
	options.shell = 'powershell'
end

toggleterm.setup(options)

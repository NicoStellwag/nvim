local toggleterm = require('toggleterm')
local Terminal = require('toggleterm.terminal').Terminal

-- custom terminals
local function get_dir_of_buffer_file()
	return vim.api.nvim_buf_get_name(0):match("(.*[/\\])")
end

local vsdevshell_cmd = [[
	powershell.exe -NoExit -Command "&{Import-Module """C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"""; Enter-VsDevShell 0638fbdc -SkipAutomaticLocation -DevCmdArguments """-arch=x64 -host_arch=x64"""}"
]]
local nmake_cmd = [[
	powershell.exe -NoExit -Command "&{Import-Module """C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"""; Enter-VsDevShell 0638fbdc -SkipAutomaticLocation -DevCmdArguments """-arch=x64 -host_arch=x64"""; nmake}"
]]

function _VSDEVSHELL_TOGGLE()
	local curr_dir = get_dir_of_buffer_file()
	if curr_dir == nil then
		return
	end
	local vsdevshell_term = Terminal:new({
		direction = 'float',
		cmd = nmake_cmd,
		dir = curr_dir
	})
	vsdevshell_term:toggle()
end
function _NMAKE_TOGGLE()
	local curr_dir = get_dir_of_buffer_file()
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

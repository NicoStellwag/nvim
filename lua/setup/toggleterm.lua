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

local default_term = Terminal:new({
	direction = 'float'
})
local vsdevshell_term = nil
local nmake_term = nil

function _DEFAULT_TOGGLE()
	default_term:toggle()
end

function _VSDEVSHELL_TOGGLE()
	if vsdevshell_term == nil then
		local curr_dir = get_dir_of_buffer_file()
		if curr_dir == nil then
			return
		end
		vsdevshell_term = Terminal:new({
			direction = 'float',
			cmd = vsdevshell_cmd,
			dir = curr_dir
		})
	end
	vsdevshell_term:toggle()
end

function _NMAKE_TOGGLE()
	if nmake_term == nil then
		local curr_dir = get_dir_of_buffer_file()
		if curr_dir == nil then
			return
		end
		nmake_term = Terminal:new({
			direction = 'float',
			cmd = nmake_cmd,
			dir = curr_dir
		})
	end
	nmake_term:toggle()
end

-- general config
local options = {}
if vim.fn.has('win32unix') and not vim.fn.has('wsl') then
	options.shell = 'powershell'
end

toggleterm.setup(options)

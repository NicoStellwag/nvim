local toggleterm = require('toggleterm')
local Terminal = require('toggleterm.terminal').Terminal

-- general config
toggleterm.setup()

-- helper functions
local get_dir_of_buffer_file = function()
	return vim.api.nvim_buf_get_name(0):match("(.*[/\\])")
end

local goto_insert_mode = function(term)
	vim.cmd('startinsert!')
end

-- default terminal
local default_term = Terminal:new({
	direction = 'float',
	on_open = goto_insert_mode,
})
function _DEFAULT_TOGGLE()
	default_term:toggle()
end

-- vs developer powershell
local vsdevshell_cmd = [[
	powershell.exe -NoExit -Command '&{Import-Module """C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"""; Enter-VsDevShell 0638fbdc -SkipAutomaticLocation -DevCmdArguments """-arch=x64 -host_arch=x64"""}'
]]
local vsdevshell_term = nil
local dir = nil
function _VSDEVSHELL_TOGGLE()
	dir = get_dir_of_buffer_file()
	if vsdevshell_term == nil then
		vsdevshell_term = Terminal:new({
			direction = 'float',
			cmd = vsdevshell_cmd,
			on_open = function(term)
				if dir ~= nil then
					term:change_dir(dir)
				end
				goto_insert_mode(term)
			end
		})
	end
	vsdevshell_term:toggle()
end

-- highlight matching brackets
vim.opt.showmatch = true

-- show relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight current line
vim.opt.cursorline = true

-- match tabs to prev line on new line
vim.opt.autoindent = true

-- nvim use block cursor
vim.opt.guicursor = "i:block"

-- set tabspace to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- smartsearch (case sensitive only if contains upper case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep cursor in the middle of the screen
vim.opt.scrolloff = 5

-- powershell default on windows
local is_windows = vim.fn.has('win32') == 1 or vim.fn.has('win32unix') == 1
local is_wsl = vim.fn.has('wsl') == 1
if is_windows and not is_wsl then
	vim.o.shell = 'powershell.exe'
	vim.o.shellcmdflag = '-c'
	vim.o.shellquote = '"'
	vim.o.shellxquote = ''
end

-- always show the sign column
vim.wo.signcolumn = "yes"

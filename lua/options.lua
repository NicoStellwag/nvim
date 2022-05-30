local opt = vim.opt

-- highlight matching brackets
opt.showmatch = true

-- show relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- highlight current line
opt.cursorline = true

-- match tabs to prev line on new line
opt.autoindent = true

-- nvim use block cursor
opt.guicursor = "i:block"

-- set tabspace to 4 spaces
opt.tabstop = 4
opt.shiftwidth = 4

-- Use normal clipboard
vim.cmd([[
	if !empty(provider#clipboard#Executable())
		set clipboard+=unnamedplus
	endif
]])

-- smartsearch (case sensitive only if contains upper case
opt.ignorecase = true
opt.smartcase = true

-- keep cursor in the middle of the screen
opt.scrolloff = 5

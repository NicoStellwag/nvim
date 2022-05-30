local function get_setup(name)
	return string.format('require("setup/%s")', name)
end

return require('packer').startup(function()
	-- themes
	use({
		'joshdick/onedark.vim',
		-- config = get_setup("onedark")
	})
	use({
		'shaunsingh/nord.nvim',
		-- config = get_setup("nord")
	})
	use({
		'sainnhe/gruvbox-material',
		config = get_setup("gruvbox-material")
	})
	-- normal vim plugins
	use({
		'lervag/vimtex',
		config = get_setup("vimtex")
	})
	-- neovim / lua plugins
	use('b3nj5m1n/kommentary')
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = get_setup("lualine")
	})
	use({
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = get_setup("telescope")
	})
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = get_setup("treesitter")
	})
end)

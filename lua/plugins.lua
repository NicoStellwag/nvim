local function get_setup(name)
	return string.format('require("setup/%s")', name)
end

return require('packer').startup(function(use)
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

	-- lsp plugins
	use({
		'williamboman/nvim-lsp-installer',
		{
			'neovim/nvim-lspconfig',
			config = function() -- make sure installer is run before config
				require("nvim-lsp-installer").setup({})
				require("setup/lspconfig")
			end
		}
	})
	use({
		'tami5/lspsaga.nvim',
		config = get_setup("lspsaga")
	})
	--[[ use({
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets'
		},
		config = get_setup("nvim-cmp")
	}) ]]
end)

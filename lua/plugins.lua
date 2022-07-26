local function get_setup(name)
	return string.format('require("setup/%s")', name)
end

return require('packer').startup(function(use)
	-- packer itself
	use({
		'wbthomason/packer.nvim'
	})

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
	use({
		'b3nj5m1n/kommentary'
	})
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = get_setup("lualine")
	})
	use({
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = get_setup("telescope")
	})
	use({
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	})
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = get_setup("treesitter")
	})
	use({
		'windwp/nvim-autopairs',
		config = get_setup("autopairs")
	})
	use({
		'David-Kunz/treesitter-unit'
	})
	use({"akinsho/toggleterm.nvim",
		tag = 'v2.*',
		config = get_setup("toggleterm")
	})
	use({
		'nmac427/guess-indent.nvim',
		config = get_setup("guess-indent")
	})
	use({
		'lewis6991/gitsigns.nvim',
		config = get_setup("gitsigns")
	})

	-- dap plugins
	use({
		'mfussenegger/nvim-dap',
		config = get_setup('dap')
	})
	use({
		'rcarriga/nvim-dap-ui',
		config = get_setup('dap-ui')
	})


	-- lsp plugins
	use({
		'williamboman/nvim-lsp-installer',
		{
			'neovim/nvim-lspconfig',
			config = function() -- make sure installer is run before config
				require("setup/lsp-installer")
				require("setup/lspconfig")
			end
		}
	})
	use({
		'tami5/lspsaga.nvim',
		config = get_setup("lspsaga")
	})
	use({
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
		},
		config = get_setup("nvim-cmp")
	})
	use({
		'hrsh7th/cmp-vsnip'
	})
	use({
		'hrsh7th/vim-vsnip'
	})
	use({
		'rafamadriz/friendly-snippets'
	})
end)

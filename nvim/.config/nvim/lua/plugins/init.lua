vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	use {'wbthomason/packer.nvim'}

	use {'folke/tokyonight.nvim'}

	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	use {
		'akinsho/bufferline.nvim',
		tag = "v2.*",
		requires = 'kyazdani42/nvim-web-devicons'
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons' -- optional, for file icon
		}
	}

	-- use {"terrortylor/nvim-comment"}
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use {'JoosepAlviste/nvim-ts-context-commentstring'}

	use {"folke/which-key.nvim"}

	use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}

	use {'neovim/nvim-lspconfig'}

	use {'hrsh7th/cmp-nvim-lsp'}

	use {'hrsh7th/cmp-buffer'}

	use {'hrsh7th/cmp-path'}

	use {'hrsh7th/cmp-cmdline'}

	use {'hrsh7th/nvim-cmp'}

	-- For luasnip users.
	use {'L3MON4D3/LuaSnip'}

	use {"rafamadriz/friendly-snippets"}

	use {'saadparwaiz1/cmp_luasnip'}

	use {'windwp/nvim-autopairs'}

	use {'onsails/lspkind.nvim'}

	use {'folke/lua-dev.nvim'}

	use {'lewis6991/gitsigns.nvim'}

	use {"lukas-reineke/indent-blankline.nvim"}

	use {"jose-elias-alvarez/null-ls.nvim"}

	use {"alexghergh/nvim-tmux-navigation"}

	use {"elixir-editors/vim-elixir"}

	use {"janko-m/vim-test"}

	use {'simrat39/rust-tools.nvim'}

	-- Debugging Rust
	use {'nvim-lua/plenary.nvim'}
	use {'mfussenegger/nvim-dap'}

	use {'tpope/vim-projectionist'}
	-- use {'~/projects/lua/plugins/stack_map_nvim_tutorial.nvim'}

	-- Lua docs stuff
	use {'nanotee/luv-vimdocs'}
	use {'milisims/nvim-luaref'}

	use {'tpope/vim-vinegar'}

	use {'mg979/vim-visual-multi'}

	use {'alvan/vim-closetag'}

	use {'mattn/emmet-vim'}

	use {'tpope/vim-surround'}
	use {'tpope/vim-repeat'}

end)

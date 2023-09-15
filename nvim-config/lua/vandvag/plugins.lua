local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't get error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- The plugins go here
	use "wbthomason/packer.nvim" -- packer manages itself

	-- These 2 are needed for a lot of other plugins
	use "nvim-lua/popup.nvim"  -- An implementation of the Popup API from vim to Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions that are used in a lot of plugins

	-- Colorschemes
	use { "catppuccin/nvim", as = "catppuccin" }
	use 'Mofiqul/vscode.nvim'
	use "EdenEast/nightfox.nvim"

	-- Cmp plugins
	use "hrsh7th/nvim-cmp"        -- The completion plugin
	use "hrsh7th/cmp-buffer"      -- Buffer completions
	use "hrsh7th/cmp-path"        -- Path completions
	use "hrsh7th/cmp-cmdline"     -- Command line completions
	use "hrsh7th/cmp-nvim-lsp"    -- Completions for LSP
	use "hrsh7th/cmp-nvim-lua"
	use "saadparwaiz1/cmp_luasnip" -- Snippet completions

	use "windwp/nvim-autopairs"

	-- Snippets
	use "L3MON4D3/LuaSnip"            -- Snippet engine
	use "rafamadriz/friendly-snippets" -- A bunch of snippets to use

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },          -- Required
			{ 'williamboman/mason.nvim' },        -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		}
	}

	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

	-- Lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use 'kyazdani42/nvim-web-devicons'

	-- File Tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly'               -- optional, updated every week. (see issue #1193)
	}


	-- Tree sitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}

	-- Gitsigns
	use "lewis6991/gitsigns.nvim"

	-- Telescope (fuzzy finder)
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- using packer.nvim
	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

	-- Tmux navigator
	use 'christoomey/vim-tmux-navigator'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTAP then
		require("packer").sync()
	end
end)

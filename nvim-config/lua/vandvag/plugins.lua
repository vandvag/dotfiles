local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Plugins that are used by other plugins
	'kyazdani42/nvim-web-devicons',
	'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim to Neovim
	'nvim-lua/plenary.nvim',

	-- Colorschemes
	'catppuccin/nvim',
	'rebelot/kanagawa.nvim',

	-- Cmp plugins
	'hrsh7th/nvim-cmp',            -- The completion plugin
	'hrsh7th/cmp-buffer',          -- Buffer completions
	'hrsh7th/cmp-path',            -- Path completions
	'hrsh7th/cmp-cmdline',         -- Command line completions
	'hrsh7th/cmp-nvim-lsp',        -- Completions for LSP
	'hrsh7th/cmp-nvim-lua',
	'saadparwaiz1/cmp_luasnip',    -- Snippet completions
	'L3MON4D3/LuaSnip',            -- Snippet engine
	'rafamadriz/friendly-snippets', -- A bunch of snippets to use

	-- Autopairs
	'windwp/nvim-autopairs',

	-- LSPconfig
	{ 'neovim/nvim-lspconfig' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },

	-- Lualine
	'nvim-lualine/lualine.nvim',

	-- Treesitter
	'nvim-treesitter/nvim-treesitter',

	-- Gitsigns
	'lewis6991/gitsigns.nvim',

	-- Telescope (fuzzy finder)
	'nvim-telescope/telescope.nvim',

	-- Tmux navigator
	-- 'christoomey/vim-tmux-navigator',

	-- Harpoon
	'ThePrimeagen/harpoon',
}

local opts = {}

require("lazy").setup(plugins, opts)

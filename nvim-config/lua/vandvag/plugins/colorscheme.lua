return {
	-- Ef themes
	{
		"oonamo/ef-themes.nvim",
		opts = {
			light = "ef-day",
			dark = "ef-bio",
			styles = {
				comments = { italic = false },
				pickers = "borderless" -- can be default
			},
		},
	},
	-- Kanagawa
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000,
		opts = {
			theme = "wave"
		},
	},
	-- Github
	{
		'projekt0n/github-nvim-theme',
		lazy = false,  -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},
	-- catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	-- rose-pine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		opts = {},
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	-- Melange
	{ "savq/melange-nvim" },
	-- Eldritch
	{ "eldritch-theme/eldritch.nvim" },
	-- Fluoromachine
	{ "maxmx03/fluoromachine.nvim" },
	{ "ricardoraposo/gruvbox-minor.nvim" },
	{ "rktjmp/lush.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ "Mofiqul/vscode.nvim" },
}

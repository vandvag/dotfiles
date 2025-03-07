return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		debug = { enabled = true },
		dashboard = { enabled = true },
		git = { enabled = true },
		lazygit = { enabled = true },
		zen = { enabled = true },
	},
	keys = {
		{ "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
	},
}

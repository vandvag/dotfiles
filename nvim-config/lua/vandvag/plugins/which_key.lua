return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			mode = { "n", "v" },
			{ "<leader>c", group = "code" },
			{ "<leader>f", group = "find/file" },
			{ "<leader>b", group = "buffer" },
			{ "g",         group = "goto" },

		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}

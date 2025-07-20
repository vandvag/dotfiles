return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.surround").setup()
			require("mini.notify").setup()
			require("mini.files").setup()
			require("mini.indentscope").setup()
			require("mini.cursorword").setup()
			require("mini.icons").setup()
			require("mini.diff").setup()
			require("mini.pairs").setup()
			require("mini.bracketed").setup()
		end,
		keys = {
			{ "<leader>fm", function() MiniFiles.open() end, desc = "Open MiniFiles" },
		}
	},
}

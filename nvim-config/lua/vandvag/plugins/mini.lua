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
			require("mini.statusline").setup()
		end,
		keys = {
			{ "<leader>o", function() MiniFiles.open() end, desc = "Open MiniFiles" },
		}
	},
}

return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup()
			require("mini.bracketed").setup()
			require("mini.surround").setup()
			require("mini.notify").setup()
			-- require("mini.tabline").setup()
			require("mini.files").setup()
			require("mini.indentscope").setup()
			require("mini.cursorword").setup()
		end,
	},
}

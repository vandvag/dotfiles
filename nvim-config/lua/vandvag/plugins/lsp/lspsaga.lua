return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},

	config = function()
		local lspsaga = require('lspsaga')
		lspsaga.setup({
			code_action_prompt = { enable = false },
			code_action_icon = "",
		})
	end,
}

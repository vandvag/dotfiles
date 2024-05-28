return {
	"folke/trouble.nvim",

	config = function()
		local trouble = require("trouble")

		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "<leader>d", function() trouble.toggle() end, opts)
	end,
}

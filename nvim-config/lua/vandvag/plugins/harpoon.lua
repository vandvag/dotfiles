return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	config = function()
		local keymap = vim.keymap
		local remap = require("vandvag.core.utils").remap

		remap("n", "<leader>s", ":Telescope harpoon marks<cr>", "Show harpoon marks")
		remap("n", "<leader>m", ":lua require('harpoon.mark').add_file()<cr>", "Add harpoon mark")
		remap("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle harpoon quick menu")
		remap("n", "<a-1>", ":lua require('harpoon.ui').nav_file(1)<cr>", "Go to harpoon mark 1")
		remap("n", "<a-2>", ":lua require('harpoon.ui').nav_file(2)<cr>", "Go to harpoon mark 2")
		remap("n", "<a-3>", ":lua require('harpoon.ui').nav_file(3)<cr>", "Go to harpoon mark 3")
		remap("n", "<a-4>", ":lua require('harpoon.ui').nav_file(4)<cr>", "Go to harpoon mark 4")
	end
}

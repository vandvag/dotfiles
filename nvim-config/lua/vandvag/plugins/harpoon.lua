return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	config = function()
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		keymap.set("n", "<leader>s", ":Telescope harpoon marks<cr>", opts)
		keymap.set("n", "<leader>m", ":lua require('harpoon.mark').add_file()<cr>", opts)
		keymap.set("n", "<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
		keymap.set("n", "<a-1>", ":lua require('harpoon.ui').nav_file(1)<cr>", opts)
		keymap.set("n", "<a-2>", ":lua require('harpoon.ui').nav_file(2)<cr>", opts)
		keymap.set("n", "<a-3>", ":lua require('harpoon.ui').nav_file(3)<cr>", opts)
		keymap.set("n", "<a-4>", ":lua require('harpoon.ui').nav_file(4)<cr>", opts)
	end
}

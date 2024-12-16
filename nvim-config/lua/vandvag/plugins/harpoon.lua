return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim"
	},
	keys = {
		{
			"<leader>hs", ":Telescope harpoon marks<cr>", desc = "Show harpoon marks"
		},
		{
			"<leader>hm", ":lua require('harpoon.mark').add_file()<cr>", desc = "Add harpoon mark"
		},
		{
			"<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle harpoon quick menu"
		},
		{
			"<a-1>", ":lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to harpoon mark 1"
		},
		{
			"<a-2>", ":lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to harpoon mark 2"
		},
		{
			"<a-3>", ":lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to harpoon mark 3"
		},
		{
			"<a-4>", ":lua require('harpoon.ui').nav_file(4)<cr>", desc = "Go to harpoon mark 4"
		},
	},
}

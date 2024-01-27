return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
					n = {
						["q"] = actions.close
					},
				}
			}
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap
		keymap.set("n", "<leader>f",
			"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false, hidden = true}))<cr>",
			opts)
		keymap.set("n", "<leader>t",
			"<cmd>lua require'telescope.builtin'.lsp_workspace_symbols(require('telescope.themes').get_dropdown({ previewer = false}))<cr>",
			opts)
		keymap.set("n", "<leader>r", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
		keymap.set("n", "<leader>a", "<cmd>lua require'telescope.builtin'.buffers()<cr>", opts)
	end,
}

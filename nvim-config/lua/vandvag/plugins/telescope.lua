return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"debugloop/telescope-undo.nvim"
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
				},
				file_ignore_patterns = {
					".git/"
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true
				}
			}
		})

		telescope.load_extension("fzf")
		telescope.load_extension("undo")

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
		keymap.set("n", "<leader>kt", ":Telescope colorscheme<cr>")
		keymap.set("n", "<leader>q", ":Telescope marks<cr>")
		keymap.set("n", "<leader>u", ":Telescope undo<cr>")
		keymap.set("n", "<leader>gb", "<cmd> lua require'telescope.builtin'.git_bcommits()<cr>", opts)
		keymap.set("n", "<leader>gs", ":Telescope grep_string<cr>")
	end,
}

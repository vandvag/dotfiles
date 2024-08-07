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
					},
					n = {
						["q"] = actions.close
					},
				},
				file_ignore_patterns = {
					".git/",
					".hg/",
					"build*/"
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true
				},
				find_files = {
					previewer = true,
					hidden = true,
				},
				lsp_dynamic_workspace_symbols = {
					theme = "cursor",
					previewer = false,
				}
			}
		})

		telescope.load_extension("fzf")
		telescope.load_extension("undo")

		-- set keymaps
		local opts = { noremap = true, silent = true }
		local keymap = vim.keymap
		keymap.set("n", "<leader>ff", ":Telescope find_files<cr>")
		keymap.set("n", "<leader>t",
			"<cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols(require('telescope.themes').get_dropdown({ previewer = false}))<cr>",
			opts)
		keymap.set("n", "<leader>r", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", opts)
		keymap.set("n", "<leader>ba", "<cmd>lua require'telescope.builtin'.buffers()<cr>", opts)
		keymap.set("n", "<leader>kt", ":Telescope colorscheme<cr>")
		keymap.set("n", "<leader>q", ":Telescope marks<cr>")
		keymap.set("n", "<leader>u", ":Telescope undo<cr>")
		keymap.set("n", "<leader>gb", "<cmd> lua require'telescope.builtin'.git_bcommits()<cr>", opts)
		keymap.set("n", "<leader>gs", ":Telescope grep_string<cr>")
	end,
}

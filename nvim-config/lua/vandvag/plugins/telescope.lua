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
				path_display = {
					"truncate",
					filename_first = {
						reverse_directories = true,
					},
				},

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

				layout_strategy = 'vertical',
				layout_config = {
					width = vim.o.columns,
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
					theme = "ivy",
					previewer = false,
				},
				buffers = {
					theme = "ivy",
					preview_width = 0.7,
				}
			}
		})

		telescope.load_extension("fzf")
		telescope.load_extension("undo")

		-- set keymaps
		local builtin = require("telescope.builtin")
		local noremap = require("vandvag.core.utils").noremap
		noremap("n", "<leader>ff", builtin.find_files, "Show files in workspace")
		noremap("n", "<leader>ft", builtin.lsp_dynamic_workspace_symbols, "Show workspace symbols")
		noremap("n", "<leader>fr", builtin.live_grep, "Search workspace for string")
		noremap("n", "<leader>fb", builtin.buffers, "Show open buffers")
		noremap("n", "<leader>kt", builtin.colorscheme, "Show available colorschemes")
		noremap("n", "<leader>q", builtin.marks, "Show vim marks")
		noremap("n", "<leader>gb", builtin.git_bcommits, "Show local git commits")
		noremap("n", "<leader>gs", builtin.grep_string, "Search for word under cursor")
		-- keymap.set("n", "<leader>u", builtin.undo, opts)
	end,
}

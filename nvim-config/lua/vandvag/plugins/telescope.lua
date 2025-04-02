return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"echasnovski/mini.icons",
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
					enable_preview = true,
					theme = "ivy",
				},
				fd = {
					previewer = false,
					theme = "ivy",
					hidden = true,
				},
				find_files = {
					previewer = false,
					theme = "ivy",
					hidden = true,
				},
				lsp_dynamic_workspace_symbols = {
					theme = "ivy",
					previewer = false,
				},
				buffers = {
					theme = "ivy",
				},
				quickfix = {
					theme = "ivy",
				},
				live_grep = {
					theme = "ivy",
				}
			}
		})

		telescope.load_extension("fzf")
		telescope.load_extension("undo")

		-- set keymaps
		local builtin = require("telescope.builtin")
		local noremap = require("vandvag.core.utils").noremap

		noremap("n", "<leader>fm", builtin.marks, "Show vim marks")
		noremap("n", "<leader>fq", builtin.quickfix, "Show quickfix list")
		noremap("n", "<leader>ff", builtin.fd, "Show files in workspace")
		noremap("n", "<leader><leader>", builtin.fd, "Show files in workspace")
		noremap("n", "<leader>ft", builtin.lsp_dynamic_workspace_symbols, "Show workspace symbols")
		noremap("n", "<leader>bb", builtin.buffers, "Show open buffers")
		noremap("n", "<leader>,", builtin.buffers, "Show open buffers")
		noremap("n", "<leader>kt", builtin.colorscheme, "Show available colorschemes")
		noremap("n", "<leader>fg", builtin.live_grep, "Search workspace for string")
		noremap("n", "<leader>fs", builtin.grep_string, "Search for word under cursor")
	end,
}

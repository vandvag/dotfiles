return {
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set('n', '<leader>ca', "<cmd>Lspsaga code_action<cr>", opts)
			vim.keymap.set('n', 'gD', function() vim.lsp.buf.declarations() end, opts)
			-- keymap.set('n', 'gd', ":lua require 'telescope.builtin'.definition(require('telescope.themes').get_dropdown({}))<cr>", opts)
			-- keymap.set('n', 'gd', '<cmd>Telecope lsp_definitions<cr>', opts)
			vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
			vim.keymap.set('n', 'gt', "<cmd>Telescope lsp_type_definitions<cr>", opts)
			vim.keymap.set('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", opts)
			vim.keymap.set('n', 'gr',
				":lua require 'telescope.builtin'.lsp_references(require('telescope.themes').get_dropdown({}))<cr>", opts)
			vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<cr>", opts)
			vim.keymap.set("n", "[d", "<cmd>Lspsaga diagonstic_jump_prev<cr>", opts)      -- jump to previous diagnostic in buffer
			vim.keymap.set("n", "]d",  "<cmd>Lspsaga diagonstic_jump_next<cr>", opts)      -- jump to next diagnostic in buffer
			vim.keymap.set("n", '<leader>e', function() vim.diagnostic.open_float() end, opts) -- show diagnostics for line
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy"
					}
				}
			}
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end
}

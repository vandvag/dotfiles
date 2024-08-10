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


		local noremap = require("vandvag.core.utils").noremap
		local on_attach = function(_, bufnr)
			local additional_opts = { buffer = bufnr }
			noremap('n', '<leader>rn', ":lua vim.lsp.buf.rename()<cr>", "Rename symbol under cursor", additional_opts)
			noremap('n', '<leader>ca', "<cmd>Lspsaga code_action<cr>", "Show code actions", additional_opts)
			noremap('n', 'gD', ":lua vim.lsp.buf.declarations()<cr>", "Go to declaration", additional_opts)
			noremap('n', 'gd', ":lua vim.lsp.buf.definition()<cr>", "Go to definition", additional_opts)
			noremap('n', 'gt', "<cmd>Telescope lsp_type_definitions<cr>", "Show type definitions", additional_opts)
			noremap('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", "Show type implementations", additional_opts)
			noremap('n', 'gr', ":lua require('telescope.builtin').lsp_references()<cr>", "Show symbol references",
				additional_opts)
			noremap('n', 'K', "<cmd>Lspsaga hover_doc<cr>", "Show symbol documentation", additional_opts)
			noremap("n", "[d", vim.diagnostic.goto_prev, "Jump to previous diagnostic in buffer",
				additional_opts)
			noremap("n", "]d", vim.diagnostic.goto_next, "Jump to next diagnostic in buffer", additional_opts)
			noremap("n", '<leader>e', function() vim.diagnostic.open_float() end, "Show diagnostics for line", additional_opts)
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

		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["zls"].setup({
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

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
			-- noremap('n', '<leader>rn', ":lua vim.lsp.buf.rename()<cr>", "Rename symbol under cursor", additional_opts)
			noremap('n', 'gD', ":lua vim.lsp.buf.declarations()<cr>", "Go to declaration", additional_opts)
			noremap('n', 'gd', ":lua vim.lsp.buf.definition()<cr>", "Go to definition", additional_opts)
			noremap('n', 'gt', "<cmd>Telescope lsp_type_definitions<cr>", "Show type definitions", additional_opts)
			noremap('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", "Show type implementations", additional_opts)
			-- noremap("n", '<leader>e', function() vim.diagnostic.open_float() end, "Show diagnostics for line", additional_opts)
			local toggle_virtual_lines = function()
				local new_val = not vim.diagnostics.config().virtual_lines
				vim.diagnostics.config({ virtual_lines = new_val })
			end
			noremap('n', 'gk', toggle_virtual_lines, "Toggle virtual lines", additional_opts)
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

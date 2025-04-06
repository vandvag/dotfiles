return {
	"neovim/nvim-lspconfig",
	dependencies = {
		'saghen/blink.cmp',
		-- "hrsh7th/cmp-nvim-lsp",
		-- { "antosha417/nvim-lsp-file-operations", config = true },
	},
	opts = {
		servers = {
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy"
						}
					}
				}
			},
			clangd = {},
			pyright = {},
			zls = {},
			gopls = {},
			lua_ls = {
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
			},
		}
	},
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local noremap = require("vandvag.core.utils").noremap

		local on_attach = function(_, bufnr)
			local additional_opts = { buffer = bufnr }
			noremap('n', 'gD', ":lua vim.lsp.buf.declarations()<cr>", "Go to declaration", additional_opts)
			noremap('n', 'gd', ":lua vim.lsp.buf.definition()<cr>", "Go to definition", additional_opts)
			noremap('n', 'gt', "<cmd>Telescope lsp_type_definitions<cr>", "Show type definitions", additional_opts)
			noremap('n', 'gi', "<cmd>Telescope lsp_implementations<cr>", "Show type implementations", additional_opts)
			noremap("n", '<leader>e', function() vim.diagnostic.open_float() end, "Show diagnostics for line", additional_opts)
			local toggle_virtual_lines = function()
				local new_val = not vim.diagnostic.config().virtual_lines
				vim.diagnostic.config({ virtual_lines = new_val })
			end
			noremap('n', 'gk', toggle_virtual_lines, "Toggle virtual lines", additional_opts)
			vim.diagnostic.config({ virtual_lines = true })
		end


		for server, config in pairs(opts.servers) do
			config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
			config.on_attach = on_attach
			lspconfig[server].setup(config)
		end
	end
}

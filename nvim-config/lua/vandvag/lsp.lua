require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"clangd",
		"bashls",
		"pyright",
	}
})

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false}
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', 'gr', ":lua require 'telescope.builtin'.lsp_references(require('telescope.themes').get_dropdown({}))<cr>", opts)
	vim.keymap.set('n', '<leader>e', vim.lsp.diagnostic.open_float, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

require('lspconfig').lua_ls.setup {
	on_attach = on_attach
}

require('lspconfig').rust_analyzer.setup {
	on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

require('lspconfig').clangd.setup {
	on_attach = on_attach
}

require('lspconfig').pyright.setup {
	on_attach = on_attach
}

require('lspconfig').bashls.setup {
	on_attach = on_attach
}

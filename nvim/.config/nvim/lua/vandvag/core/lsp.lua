vim.lsp.enable({
  "clangd",
  "gopls",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "zls",
})

local noremap = require("vandvag.core.utils").noremap

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local additional_opts = { buffer = args.buff }
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Completion settings
    if client and client:supports_method('textDocument/completion') then
      -- vim.lsp.completion.enable(true, client.id, args.buff, { autotrigger = true })
      vim.lsp.config('*', {
        capabilities = require('blink-cmp').get_lsp_capabilities()
      })
    end

    -- Inlay hints settings
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true)
      noremap('n', '<leader>ch', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, "Toggle inlay hints", additional_opts)
    end

    -- Hover settings
    if client and client.server_capabilities.hoverProvider then
      noremap('n', 'K', function() vim.lsp.buf.hover() end, "Get hover info", additional_opts)
    end

    noremap('n', 'gd', vim.lsp.buf.definition, "Go to definition", additional_opts)
    noremap('n', '<leader>e', function() vim.diagnostic.open_float() end, "Open diagnostic float", additional_opts)
  end
})


vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
})

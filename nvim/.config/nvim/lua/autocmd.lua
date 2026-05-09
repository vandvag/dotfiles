-- Autocommands

vim.api.nvim_create_autocmd(
  "ColorScheme",
  {
    callback = function()
      require("utils").sync_theme_to_tmux()
    end
  }
)

vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    callback = function(args)
      local bufnotsave = vim.b[args.buf].formatonoff_disable
      if bufnotsave then return end
      if not vim.bo[args.buf].modifiable then return end

      local clients = vim.lsp.get_clients({ bufnr = args.buf })
      if next(clients) ~= nil then
        vim.lsp.buf.format({ bufnr = args.buf, async = true })
      end
    end
  }
)

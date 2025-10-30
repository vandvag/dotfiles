-- Autocommands

vim.api.nvim_create_autocmd(
  "ColorScheme",
  {
    callback = function()
      require("vandvag.core.utils").sync_theme_to_tmux()
    end
  }
)

vim.api.nvim_create_autocmd(
  "BufWritePost",
  {
    callback = function()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) ~= nil then
        vim.lsp.buf.format()
      end
    end
  }
)

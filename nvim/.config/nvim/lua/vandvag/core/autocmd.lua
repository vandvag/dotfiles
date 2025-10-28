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
      vim.lsp.buf.format()
    end
  }
)

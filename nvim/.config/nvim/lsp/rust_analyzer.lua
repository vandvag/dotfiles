return {
  cmd = { "rust-analyzer" },
  settings = {
    ['rust-analyzer'] = {
      cargo = { targetDir = true },
      check = { command = 'clippy' },
      inlayHints = {
        bindingModeHints = { enabled = true },
        closureCaptureHints = { enabled = true },
        closureReturnTypeHints = { enable = 'always' },
        maxLength = 100,
      },
      rustc = { source = 'discover' },
    }
  },
  filetypes = { "rust" },
  root_markers = {
    ".git"
  },
}

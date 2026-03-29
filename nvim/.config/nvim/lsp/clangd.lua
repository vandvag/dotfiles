return {
  cmd = {
    "clangd",
    "--clang-tidy",
    "-j=5",
    "--fallback-style=google",
  },
  filetypes = { "c", "h", "h.c", "hpp", "cpp" },
}

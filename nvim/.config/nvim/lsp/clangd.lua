return {
  cmd = {
    "clangd",
    "--clang-tidy",
    "-j=5",
    "--fallback-style=goole",
  },
  filetypes = { "c", "h", "h.c", "hpp", "cpp" },
}

return {
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "Snacks", "MiniFiles", "MiniPick" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
          [vim.fn.stdpath("data") .. "lazy/lazy.nvim"] = true,
        },
      },
    },
  },
  filetypes = { "lua" },
}

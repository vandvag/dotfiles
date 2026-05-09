vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/windwp/nvim-ts-autotag",
})

local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    "c",
    "cpp",
    "rust",
    "cmake",
    "python",
    "lua",
    "markdown",
    "markdown_inline",
    "json",
    "toml",
    "yaml",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

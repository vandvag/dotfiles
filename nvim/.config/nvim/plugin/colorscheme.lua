vim.pack.add({
  "https://github.com/oonamo/ef-themes.nvim",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/folke/tokyonight.nvim",
})

local ef = require('ef-themes')
ef.setup({
  styles = {
    comments = { italic = false },
    pickers = "borderless"
  }
})

vim.cmd.colorscheme('ef-dark')

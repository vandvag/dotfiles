vim.pack.add({
  { src = "https://github.com/oonamo/ef-themes.nvim" },
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/folke/tokyonight.nvim" },
})

local ef = require('ef-themes')
ef.setup({
  styles = {
    comments = { italic = false },
    pickers = "borderless"
  }
})

vim.cmd.colorscheme('ef-dark')

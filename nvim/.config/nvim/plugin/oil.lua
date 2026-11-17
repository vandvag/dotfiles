vim.pack.add({
  'https://github.com/stevearc/oil.nvim',
})

local oil = require("oil")
oil.setup({
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "<leader>fm", "<cmd>Oil<cr>", { silent = true, desc = "Oil" })

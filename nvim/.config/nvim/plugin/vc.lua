local utils = require('utils')

vim.pack.add({
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/lewis6991/gitsigns.nvim"
})

utils.noremap("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame")
utils.noremap("n", "<leader>gb", ":Gitsigns blame_line<cr>", "Blame current line")

utils.noremap("n", "<leader>gg", ":G<cr>", "Fugitive")
utils.noremap("n", "<leader>gf", ":Git blame<cr>", "Blame file")

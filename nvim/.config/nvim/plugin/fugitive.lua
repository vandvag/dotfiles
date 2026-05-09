local utils = require('utils')

vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

utils.noremap("n", "<leader>gg", ":G<cr>", "Fugitive")

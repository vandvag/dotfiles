local utils = require("utils")

vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

utils.noremap("n", "<leader>gf", ":Gitsigns blame<cr>", "Blame file")
utils.noremap("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame")
utils.noremap("n", "<leader>gb", ":Gitsigns blame_line<cr>", "Blame current line")

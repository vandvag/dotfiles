local noremap = require("utils").noremap

vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  bigfile = { enabled = true },
  lazygit = { enabled = true },
})

noremap("n", "<leader>e", "<Nop>", "Disable (LSP diagnostic handles <leader>e)")
noremap("n", "<leader>gg", function() Snacks.lazygit() end, "Lazygit")


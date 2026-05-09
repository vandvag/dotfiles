local noremap = require("utils").noremap
vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  notifier = { enabled = true },
  quickfile = { enabled = true },
  bigfile = { enabled = true },
  words = { enabled = true },
  debug = { enabled = true },
  lazygit = { enabled = true },
  input = { enabled = true },
})

noremap("n", "<leader>e", "<Nop>", "Disable (LSP diagnostic handles <leader>e)")
noremap("n", "<leader>gg", function() Snacks.lazygit() end, "Lazygit")

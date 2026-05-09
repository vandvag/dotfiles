local utils = require("utils")
vim.pack.add({ "https://github.com/folke/which-key.nvim" })


local which_key = require("which-key")
which_key.setup({
  spec = {
    mode = { "n", "v" },
    { "<leader>c", group = "code/lsp" },
    { "<leader>f", group = "find/file" },
    { "<leader>b", group = "buffer" },
    { "<leader>s", group = "search" },
    { "<leader>q", group = "quickfix" },
    { "<leader>g", group = "git" },
    { "<leader>h", group = "help" },
    { "<leader>j", group = "[j]harpoon" },
    { "<leader>k", group = "utilities" },
    { "g",         group = "goto" },
  },
})

utils.noremap(
  "n",
  "<leader>?",
  function()
    require("which-key").show({ global = false })
  end,
  "Buffer-local Keymaps"
)

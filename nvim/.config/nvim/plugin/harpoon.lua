local utils = require("utils")

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/ThePrimeagen/harpoon"
})

local add_mark = function()
  require("harpoon.mark").add_file()
  local current_filename = vim.fn.expand("%:t")
  vim.notify(string.format("File '%s' was added to harpoon list", current_filename), vim.log.levels.INFO)
end

utils.noremap("n", "<leader>jk", function() add_mark() end, "Add harpoon mark")
utils.noremap("n", "<leader>jj", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle harpoon quick menu")
utils.noremap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<cr>", "Go to harpoon mark 1")
utils.noremap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<cr>", "Go to harpoon mark 2")
utils.noremap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<cr>", "Go to harpoon mark 3")
utils.noremap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<cr>", "Go to harpoon mark 4")

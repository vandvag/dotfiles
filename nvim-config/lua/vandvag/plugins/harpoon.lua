return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  keys = {
    {
      "<leader>jk", ":lua require('harpoon.mark').add_file()<cr>", desc = "Add harpoon mark"
    },
    {
      "<leader>jj", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle harpoon quick menu"
    },
    {
      "<leader>1", ":lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to harpoon mark 1"
    },
    {
      "<leader>2", ":lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to harpoon mark 2"
    },
    {
      "<leader>3", ":lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to harpoon mark 3"
    },
    {
      "<leader>4", ":lua require('harpoon.ui').nav_file(4)<cr>", desc = "Go to harpoon mark 4"
    },
  },
}

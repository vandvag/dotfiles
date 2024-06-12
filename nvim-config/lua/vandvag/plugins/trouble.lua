return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function()
    require("trouble").setup {
    }

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>d", "<cmd>Trouble diagnostics toggle<cr>", opts)
  end,
}

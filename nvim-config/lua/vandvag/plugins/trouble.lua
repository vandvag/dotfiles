return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function()
    require("trouble").setup {
    }

		local noremap = require("vandvag.core.utils").noremap
    noremap("n", "<leader>d", "<cmd>Trouble diagnostics toggle<cr>", "Show Trouble diagnostics")
  end,
}

return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
	keys = {
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
	},

  config = function()
    require("trouble").setup {
    }

		local noremap = require("vandvag.core.utils").noremap
    -- noremap("n", "<leader>d", "<cmd>Trouble diagnostics toggle<cr>", "Show Trouble diagnostics")
  end,
}

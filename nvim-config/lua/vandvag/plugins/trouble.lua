return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  ependencies = { "echasnovski/mini.icons" },
	keys = {
    {
      "<leader>ts",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>tl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>td",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>tt",
      "<cmd>Trouble todo toggle filter.buf=0<cr>",
      desc = "Todo List (Trouble)",
    },
	},

  config = function()
    require("trouble").setup{}
  end,
}

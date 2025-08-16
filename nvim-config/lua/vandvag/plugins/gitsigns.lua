return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = true,
  keys = {
    { "<leader>gf", "<cmd>Gitsigns blame<cr>",                     desc = "Blame File" },
    { "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle current line blame" }
  }
}

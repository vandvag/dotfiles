return {
  "folke/snacks.nvim",
  opts = {
    notifier = { enabled = true },
    quickfile = { enabled = true },
    bigfile = { enabled = true },
    words = { enabled = true },
    debug = { enabled = true },
    lazygit = { enabled = true },
    input = { enabled = true },
  },
  keys = {
    { "<leader>e", "<Nop>", desc = "Disable (LSP diagnostic handles <leader>e)" },
    -- <leader>g keymaps (git)
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
  },
}

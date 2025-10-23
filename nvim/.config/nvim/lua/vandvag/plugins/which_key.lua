return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
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
      { "g",         group = "goto" },

    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

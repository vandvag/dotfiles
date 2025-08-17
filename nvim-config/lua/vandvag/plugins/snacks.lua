return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },
    debug = { enabled = true },
    lazygit = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      layout = "ivy",
      sources = {
        files = { hidden = true },
      }
    },
  },
  keys = {
    -- <leader>f keymaps (Find/files)
    { "<leader>fn",       function() Snacks.picker.notifications() end,         desc = "Find notifications" },
    -- <leader>g keymaps (git)
    { "<leader>gb",       function() Snacks.git.blame_line() end,               desc = "Git Blame Line" },
    { "<leader>gg",       function() Snacks.lazygit() end,                      desc = "Lazygit" },
    { "<leader>gh",       function() Snacks.picker.git_log_file() end,          desc = "Git log file" },
    { "<leader>gd",       function() Snacks.picker.git_diff() end,              desc = "Git Diff (hunks)" },
    { "<leader>gs",       function() Snacks.picker.git_status() end,            desc = "Git Status" },
    { "<leader><leader>", function() Snacks.picker.files() end,                 desc = "Find files" },
    { "<leader>/",        function() Snacks.picker.grep() end,                  desc = "Search string" },
    { "<leader>e",        function() Snacks.picker.explorer() end,              desc = "Show file explorer" },
    { "<leader>,",        function() Snacks.picker.buffers() end,               desc = "Show buffers" },
    { "<leader>bb",       function() Snacks.picker.buffers() end,               desc = "Show buffers" },
    { "<leader>kt",       function() Snacks.picker.colorschemes() end,          desc = "Show colorschemes" },
    { "<leader>sg",       function() Snacks.picker.grep() end,                  desc = "Search string" },
    { "<leader>ss",       function() Snacks.picker.grep_word() end,             desc = "Search for word" },
    { "<leader>cs",       function() Snacks.picker.lsp_workspace_symbols() end, desc = "Show workspace symbols" },
    { "<leader>hk",       function() Snacks.picker.keymaps() end,               desc = "Show keymaps" },
    { "<leader>hh",       function() Snacks.picker.help() end,                  desc = "Show help" },
    { "<leader>qq",       function() Snacks.picker.qflist() end,                desc = "Show quickfix list" },
    { "<leader>xx",       function() Snacks.picker.diagnostics() end,           desc = "Show workspace diagnostics" },
    { "<leader>mm",       function() Snacks.picker.marks() end,                 desc = "Show marks" },
  },
}

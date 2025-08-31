return {
  "nvim-mini/mini.nvim",
  lazy = false,
  config = function()
    local miniclue = require("mini.clue")
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<leader>' },
        { mode = 'x', keys = '<leader>' },
        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },
        -- g triggers
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },
        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },
        -- Window commands
        { mode = 'n', keys = '<C-w>' },
      },
      clues = {
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
      },
      window = {
        delay = 200,
      },
    })
    require("mini.ai").setup()
    require("mini.surround").setup()
    require("mini.notify").setup()
    require("mini.files").setup()
    require("mini.cursorword").setup()
    require("mini.icons").setup()
    require("mini.diff").setup()
    require("mini.pairs").setup()
    require("mini.bracketed").setup()
    require("mini.extra").setup()
    require("mini.statusline").setup()
  end,
  keys = {
    { "<leader>fm", function() MiniFiles.open() end, desc = "Open MiniFiles" },
  }
}

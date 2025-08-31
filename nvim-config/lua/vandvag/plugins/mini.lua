local choose_all_cb = function()
  local mappings = MiniPick.get_picker_opts().mappings
  vim.api.nvim_input(mappings.mark_all .. mappings.choose_marked)
end

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
    require("mini.git").setup()
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
    require("mini.pick").setup({
      mappings = {
        choose_all_and_send_to_qf = { char = '<C-q>', func = choose_all_cb }
      }
    })
  end,
  keys = {
    { "<leader>fm",       function() MiniFiles.open() end,                                      desc = "Open MiniFiles" },
    { "<leader><leader>", function() MiniPick.registry.files() end,                             desc = "Find File" },
    { "<leader>,",        function() MiniPick.registry.buffers() end,                           desc = "Find Buffer" },
    { "<leader>/",        function() MiniPick.registry.buf_lines() end,                         desc = "Find Line in open buffers" },
    { "<leader>kt",       function() MiniPick.registry.colorschemes() end,                      desc = "Select colorscheme" },
    { "<leader>sg",       function() MiniPick.registry.grep_live() end,                         desc = "Search in project (live)" },
    { "<leader>sd",       function() MiniPick.registry.grep() end,                              desc = "Search in project" },
    { "<leader>mm",       function() MiniPick.registry.marks() end,                             desc = "Show marks" },
    { "<leader>cb",       function() MiniPick.registry.diagnostic({ scope = 'current' }) end,   desc = "Show diagnostics (buffer)" },
    { "<leader>cx",       function() MiniPick.registry.diagnostic() end,                        desc = "Show diagnostics (workspace)" },
    { "<leader>qq",       function() MiniPick.registry.list({ scope = 'quickfix' }) end,        desc = "Show quickfix list" },
    { "<leader>cs",       function() MiniPick.registry.lsp({ scope = 'workspace_symbol' }) end, desc = "Show symbols (workspace)" },

  }
}

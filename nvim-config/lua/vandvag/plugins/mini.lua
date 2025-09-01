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
    { "<leader>fm",       function() MiniFiles.open() end,              desc = "Open MiniFiles" },
    { "<leader><leader>", '<cmd>Pick files tool="fd"<cr>',              desc = "Find File" },
    { "<leader>,",        '<cmd>Pick buffers<cr>',                      desc = "Find Buffer" },
    { "<leader>/",        '<cmd>Pick buf_lines scope="current"<cr>',    desc = "Find Line (current)" },
    { "<leader>kt",       '<cmd>Pick colorschemes<cr>',                 desc = "Select colorscheme" },
    { "<leader>sg",       '<cmd>Pick grep_live<cr>',                    desc = "Search in project (live)" },
    { "<leader>sd",       '<cmd>Pick grep<cr>',                         desc = "Search in project" },
    { "<leader>mm",       '<cmd>Pick marks<cr>',                        desc = "Show marks" },
    { "<leader>cb",       '<cmd>Pick diagnostic scope = "current"<cr>', desc = "Show diagnostics (buffer)" },
    { "<leader>cx",       '<cmd>Pick diagnostic<cr>',                   desc = "Show diagnostics (workspace)" },
    { "<leader>qq",       '<cmd>Pick list scope = "quickfix"<cr>',      desc = "Show quickfix list" },
    { "<leader>cs",       '<cmd>Pick lsp scope="workspace_symbol"<cr>', desc = "Show symbols (workspace)" },
    { "<leader>ss",       '<cmd>Pick grep pattern="<cword>"<cr>',       desc = 'Grep current word' }
  }
}

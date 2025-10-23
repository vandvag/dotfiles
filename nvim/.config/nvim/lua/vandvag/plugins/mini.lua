local choose_all_cb = function()
  local mappings = MiniPick.get_picker_opts().mappings
  vim.api.nvim_input(mappings.mark_all .. mappings.choose_marked)
end

return {
  "nvim-mini/mini.nvim",
  lazy = false,
  config = function()
    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
      highlighters = {
        fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
    require("mini.ai").setup()
    require("mini.surround").setup()
    require("mini.notify").setup()
    require("mini.files").setup()
    require("mini.cursorword").setup()
    require("mini.indentscope").setup()
    require("mini.pairs").setup()
    require("mini.bracketed").setup()
    require("mini.statusline").setup()
  end,
  keys = {
    { "<leader>fm", function() MiniFiles.open() end, desc = "Open MiniFiles" },
  }
}

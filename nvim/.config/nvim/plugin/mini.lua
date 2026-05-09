vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

local utils = require("utils")

local ai = require("mini.ai")
ai.setup()

local align = require("mini.align")
align.setup()

local bracketed = require("mini.bracketed")
bracketed.setup()

local cursorword = require("mini.cursorword")
cursorword.setup()

local files = require("mini.files")
files.setup()
utils.noremap("n", "<leader>fm", function() MiniFiles.open() end, "Open MiniFiles")

local hipatterns = require("mini.hipatterns")
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

local icons = require("mini.icons")
icons.setup()

-- local indentscope = require("mini.indentscope")
-- indentscope.setup()

local notify = require("mini.notify")
notify.setup()

local pairs = require("mini.pairs")
pairs.setup()

local statusline = require("mini.statusline")
statusline.setup()

local surround = require("mini.surround")
surround.setup()

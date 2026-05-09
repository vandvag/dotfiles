local utils = require("utils")

vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local fzf = require("fzf-lua")
fzf.setup({
  winopts = {
    border = "none",
    preview = {
      default = "bat",
      border = "none",
    },
  },
  fzf_colors = true,
  defaults = {
    file_icons = "mini",
  },
  files = {
    previewer = false,
  },
  buffers = {
    previewer = false,
  },
  grep = {
    hidden = true,
  },
})

utils.noremap("n", "<leader><leader>", function() FzfLua.files() end, "Find files")
utils.noremap("n", "<leader>bb", function() FzfLua.buffers() end, "Find buffer")
utils.noremap("n", "<leader>/", function() FzfLua.grep_curbuf() end, "Search in current buffer")
-- <leader>s keymaps (search)
utils.noremap("n", "<leader>sg", function() FzfLua.grep() end, "Grep")
utils.noremap("n", "<leader>ss", function() FzfLua.grep_cword() end, "Grep selection/word")
utils.noremap("n", "<leader>sf", function() FzfLua.grep_curbuf() end, "Grep (live)")
-- <leader>q keymaps (qfixlist)
utils.noremap("n", "<leader>qq", function() FzfLua.quickfix() end, "Show quickfix list")
-- <leader>k keymaps (utility)
utils.noremap("n", "<leader>kt", function() FzfLua.colorschemes() end, "Show colorschemes")
-- <leader>c keymaps (code)
utils.noremap("n", "<leader>cs", function() FzfLua.lsp_workspace_symbols() end, "Show workspace symbols")
utils.noremap("n", "<leader>cb", function() FzfLua.lsp_document_diagnostics() end, "Show buffer diagnostics")
utils.noremap("n", "<leader>cx", function() FzfLua.lsp_workspace_diagnostics() end, "Show workspace diagnostics")
-- <leader>h keymaps (help)
utils.noremap("n", "<leader>hk", function() FzfLua.keymaps() end, "Show keymaps")
utils.noremap("n", "<leader>hh", function() FzfLua.helptags() end, "Show help")
-- <leader>m keymaps (marks)
utils.noremap("n", "<leader>mm", function() FzfLua.marks() end, "Show marks")

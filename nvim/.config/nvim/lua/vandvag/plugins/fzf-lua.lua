return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-mini/mini.icons" },
  opts = {
    winopts = {
      border = "none",
      preview = {
        border = "none",
      },
    },
    fzf_colors = true,
    files = {
      previewer = false,
    },
    buffers = {
      previewer = false,
    },
    grep = {
      hidden = true,
    },
  },
  keys = {
    { "<leader><leader>", function() FzfLua.files() end,                     desc = "Find files" },
    { "<leader>bb",       function() FzfLua.buffers() end,                   desc = "Find buffer" },
    { "<leader>,",        function() FzfLua.buffers() end,                   desc = "Find buffer" },
    { "<leader>/",        function() FzfLua.grep_curbuf() end,               desc = "Search in current buffer" },
    -- <leader>s keymaps (search)
    { "<leader>sg",       function() FzfLua.grep() end,                      desc = "Grep" },
    { "<leader>ss",       function() FzfLua.grep_cword() end,                desc = "Visual selection or word",  mode = { "n", "x" } },
    { "<leader>sf",       function() FzfLua.live_grep() end,                 desc = "Grep (live)",               mode = { "n", "x" } },
    -- <leader>q keymaps (qfixlist)
    { "<leader>qq",       function() FzfLua.quickfix() end,                  desc = "Show quickfix list" },
    -- <leader>k keymaps (utility)
    { "<leader>kt",       function() FzfLua.colorschemes() end,              desc = "Show colorschemes" },
    -- <leader>c keymaps (code)
    { "<leader>cs",       function() FzfLua.lsp_workspace_symbols() end,     desc = "Show workspace symbols" },
    { "<leader>cb",       function() FzfLua.lsp_document_diagnostics() end,  desc = "Show buffer diagnostics" },
    { "<leader>cx",       function() FzfLua.lsp_workspace_diagnostics() end, desc = "Show workspace diagnostics" },
    -- <leader>h keymaps (help)
    { "<leader>hk",       function() FzfLua.keymaps() end,                   desc = "Show keymaps" },
    { "<leader>hh",       function() FzfLua.help_tags() end,                 desc = "Show help" },
    -- <leader>m keymaps (marks)
    { "<leader>mm",       function() FzfLua.marks() end,                     desc = "Show marks" },
  },

}

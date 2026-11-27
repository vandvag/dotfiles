local utils = require("utils")

-- fzf-native ships C sources and has to be built on install/update. Register
-- this before vim.pack.add(), since add() installs missing plugins immediately.
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local data = ev.data
    if data.spec.name ~= "telescope-fzf-native.nvim" then
      return
    end
    if data.kind ~= "install" and data.kind ~= "update" then
      return
    end
    local result = vim.system({ "make" }, { cwd = data.path }):wait()
    if result.code ~= 0 then
      vim.notify(
        "Failed to build telescope-fzf-native.nvim with 'make'. Check :messages and nvim-pack.log",
        vim.log.levels.ERROR
      )
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-telescope/telescope-frecency.nvim",
})

local telescope = require("telescope")
local builtin = require("telescope.builtin")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")

telescope.setup({
  defaults = {
    -- winopts.border = "none" and winopts.preview.border = "none"
    border = false,
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },

    -- winopts.preview.default = "bat"
    -- Telescope's terminal previewers prefer bat and fall back to cat.
    file_previewer = previewers.cat.new,
    grep_previewer = previewers.vimgrep.new,
    qflist_previewer = previewers.qflist.new,

    -- grep.hidden = true
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--hidden",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    -- fzf_colors = true is implicit: Telescope inherits the active colorscheme.
  },
  pickers = {
    find_files = { previewer = false },
    fd = { previewer = false },
    buffers = { previewer = false },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    frecency = {
      db_safe_mode = false,
    },
  },
})

-- Extensions must be loaded after setup().
for _, name in ipairs({ "fzf", "frecency" }) do
  local ok, err = pcall(function() telescope.load_extension(name) end)
  if not ok then
    vim.notify("telescope-" .. name .. " extension failed to load: " .. tostring(err), vim.log.levels.WARN)
  end
end

-- rg-backed equivalent of FzfLua.grep_curbuf() ("Grep (live)"), which only
-- searches the current file. Fall back to a buffer fuzzy find for unsaved or
-- non-file buffers, since rg needs a file on disk.
local function grep_current_buffer()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" or vim.fn.filereadable(file) ~= 1 then
    builtin.current_buffer_fuzzy_find()
    return
  end
  builtin.live_grep({ search_dirs = { file }, prompt_title = "Grep (current buffer)" })
end

utils.noremap("n", "<leader><leader>", function() builtin.find_files() end, "Find files")
utils.noremap("n", "<leader>ff", function() telescope.extensions.frecency.frecency({}) end, "Find files (frecency)")
utils.noremap("n", "<leader>bb", function() builtin.buffers() end, "Find buffer")
utils.noremap("n", "<leader>/", function() builtin.current_buffer_fuzzy_find() end, "Search in current buffer")
-- <leader>s keymaps (search)
utils.noremap("n", "<leader>sg", function() builtin.live_grep() end, "Grep")
-- grep_cword uses whole-word matching; word_match = "-w" mirrors that.
utils.noremap("n", "<leader>ss", function() builtin.grep_string({ word_match = "-w" }) end, "Grep selection/word")
utils.noremap("v", "<leader>ss", function() builtin.grep_string() end, "Grep selection/word")
utils.noremap("n", "<leader>sf", grep_current_buffer, "Grep (live)")
-- <leader>q keymaps (qfixlist)
utils.noremap("n", "<leader>qq", function() builtin.quickfix() end, "Show quickfix list")
-- <leader>k keymaps (utility)
utils.noremap("n", "<leader>kt", function()
  builtin.colorscheme({
    enable_preview = true,
  })
end, "Show colorschemes")
-- <leader>c keymaps (code)
utils.noremap("n", "<leader>cs", function() builtin.lsp_workspace_symbols() end, "Show workspace symbols")
utils.noremap("n", "<leader>cb", function() builtin.diagnostics({ bufnr = 0 }) end, "Show buffer diagnostics")
utils.noremap("n", "<leader>cx", function() builtin.diagnostics() end, "Show workspace diagnostics")
-- <leader>h keymaps (help)
utils.noremap("n", "<leader>hk", function() builtin.keymaps() end, "Show keymaps")
utils.noremap("n", "<leader>hh", function() builtin.help_tags() end, "Show help")
-- <leader>m keymaps (marks)
utils.noremap("n", "<leader>mm", function() builtin.marks() end, "Show marks")

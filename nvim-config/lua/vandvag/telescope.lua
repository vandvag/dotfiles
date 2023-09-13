local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end


telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    file_ignore_patterns = {
      "*.git/*", 
      ".cache", 
      "%.o", 
      "%.a", 
      "%.out", 
      "%.class",
      "%.pdf",
    },
  },
}

-- vim.keymap.set('n', '<leader>f',
--   function()
--     builtin.find_files(require('telescope.themes').get_dropdown({ previewer = false }))
--   end)
-- vim.keymap.set('n', '<leader>r', function()
--   builtin.live_grep()
-- end)
-- vim.keymap.set('n', '\\\\', function()
--   builtin.buffers()
-- end)
-- vim.keymap.set('n', '<leader>t', function()
--   builtin.help_tags()
-- end)
-- vim.keymap.set('n', ';;', function()
--   builtin.resume()
-- end)
-- vim.keymap.set('n', ';e', function()
--   builtin.diagnostics()
-- end)

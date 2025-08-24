return {
  'vieitesss/miniharp.nvim',
  lazy = false,
  opts = {
    autoload = true,
    autosave = true,
    show_on_autoload = false
  },
  config = function()
    vim.keymap.set('n', '<leader>kj', require('miniharp').toggle_file, {desc = 'miniharp: toggle file mark'})
    vim.keymap.set('n', '<C-n>',      require('miniharp').next,        {desc = 'miniharp: next file mark'})
    vim.keymap.set('n', '<C-p>',      require('miniharp').prev,        {desc = 'miniharp: prev file mark'})
    vim.keymap.set('n', '<leader>kk', require('miniharp').show_list,   {desc = 'miniharp: list marks'})
    vim.keymap.set('n', '<leader>kc', require('miniharp').clear, {desc = 'miniharp: clear list'})
  end,
}

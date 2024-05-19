return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>ku", "<cmd>UndotreeToggle<cr>")
  end,
}

return {
  "mbbill/undotree",
  config = function()
		local noremap = require("vandvag.core.utils").noremap
    noremap("n", "<leader>ku", "<cmd>UndotreeToggle<cr>", "Toggle UndoTree")
  end,
}

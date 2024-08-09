return {
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function ()
		local remap = require("vandvag.core.utils").noremap
    remap("n", "<leader>z", "<cmd>ZenMode<cr>", "Toggle ZenMode")
  end
}

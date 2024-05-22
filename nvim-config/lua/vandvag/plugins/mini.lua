return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.surround").setup()
      require("mini.notify").setup()
      require("mini.starter").setup()
      require("mini.indentscope").setup({
        animation = require("mini.indentscope").gen_animation.none()
      }
      )
    end,
  },
}

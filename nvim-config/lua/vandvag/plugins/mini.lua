return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.surround").setup()
      require("mini.notify").setup()
    end,
  },
}

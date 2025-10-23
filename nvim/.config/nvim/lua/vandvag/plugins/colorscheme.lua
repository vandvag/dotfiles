return {
  -- Ef themes
  {
    "oonamo/ef-themes.nvim",
    opts = {
      light = "ef-day",
      dark = "ef-bio",
      styles = {
        comments = { italic = false },
        pickers = "borderless" -- can be default
      },
    },
  },
  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    opts = {
      theme = "wave"
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}

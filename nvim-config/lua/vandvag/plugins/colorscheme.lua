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
  -- rose-pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {},
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "Mofiqul/vscode.nvim" },
}

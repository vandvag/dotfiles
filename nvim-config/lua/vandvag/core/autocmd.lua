-- Autocommands

vim.api.nvim_create_autocmd(
  "ColorScheme",
  {
    callback = function()
      require("vandvag.core.utils").sync_theme_to_tmux()
    end
  }
)

local theme_group = vim.api.nvim_create_augroup("MacOSThemeSync", { clear = true })
local preferred_dark_theme = "ef-winter"
local preferred_light_theme = "ef-melissa-light"

local function sync_with_macos_theme_setting()
  local is_dark = vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null"):gsub("%s+", "") == "Dark"
  if is_dark then
    vim.cmd("colorscheme " .. preferred_dark_theme)
  else
    vim.cmd("colorscheme " .. preferred_light_theme)
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = theme_group,
  callback = sync_with_macos_theme_setting,
  desc = "Sync colorscheme with macos dark/light appearence"
})

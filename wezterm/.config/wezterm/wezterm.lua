local wezterm = require("wezterm")
local themes = require("wezterm_themes")

local PADDING = 6

local config = {}

config.font = wezterm.font "CaskaydiaCove Nerd Font"
config.font_size = 14.0
config.color_scheme = "tokyonight-storm"
config.automatically_reload_config = true
config.show_tabs_in_tab_bar = true
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"

config.window_padding = {
	left = PADDING,
	right = PADDING,
	top = PADDING,
	bottom = PADDING
}

config.keys = {
	-- { key = "k", mods = "CTRL", action = wezterm.action_callback(themes.theme_switcher) },
}


return config

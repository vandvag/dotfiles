local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local function get_sorted_themes()
	local themes = wezterm.get_builtin_color_schemes();

	local choices = {}
	for key, _ in pairs(themes) do
		table.insert(choices, { label = tostring(key) })
	end

	table.sort(choices, function(c1, c2)
		return c1.label < c2.label
	end)

	return choices
end

M.theme_switcher = function(window, pane)
	local choices = get_sorted_themes();

	local action = wezterm.action_callback(function(_, _, _, label)
		if label then
			wezterm.log_info("Selected theme " .. label)
			local overrides = window:get_config_overrides() or {}
			overrides.color_scheme = label
			window:set_config_overrides(overrides)
		end
	end)

	window:perform_action(
		act.InputSelector({
			title = "Pick a Theme!",
			choices = choices,
			fuzzy = true,
			action = action,
		}),
		pane
	)
end

M.get_random_theme = function(config)
	local themes = get_sorted_themes()
	local random_theme = themes[math.random(#themes)]["label"]
	wezterm.log_info("Theme: " .. random_theme)
	config.color_scheme = random_theme
end

return M

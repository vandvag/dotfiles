local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

M.theme_switcher = function(window, pane)
	local themes = wezterm.get_builtin_color_schemes();

	local choices = {}
	for key, _ in pairs(themes) do
		table.insert(choices, { label = tostring(key) })
	end

	table.sort(choices, function(c1, c2)
		return c1.label < c2.label
	end)

	local action = wezterm.action_callback(function(_, _, _, label)
		if label then
			wezterm.set_config({ color_scheme = label })
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

return M

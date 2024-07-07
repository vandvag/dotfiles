local wezterm = require("wezterm")

local themes = wezterm.get_builtin_color_schemes();

local function pick_theme()
	print(themes)
	local choices = table.concat(themes, '\n')
	local args = { 'sh', '-c', 'echo "' .. choices .. '" | fzf --prompt="Pick a theme: "' }

	local result = wezterm.run_child_process(args)
	if result.exit_code == 0 then
		return result.stdout:gsub('\n', '')
	end
	return nil
end

local function set_theme(theme)
	if theme and wezterm.color_schemes[theme] then
		wezterm.set_config({ color_scheme = theme })
	end
end

wezterm.on("toggle-theme-picker", function()
	local selected_theme = pick_theme()
	if selected_theme then
		set_theme(selected_theme)
	end
end)

return {
	keys = {
		{ key = "t", mods = "CTRL|ALT", action = wezterm.action { EmitEvent = "toggle-theme-picker" } },
	}
}

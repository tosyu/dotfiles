local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.keys = require "keys"
local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end

	return "Dark"
end

local function get_theme()
	if get_appearance():find "Dark" then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

print(wezterm.target_triple)
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = {"pwsh.exe -NoLogo"}
end

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font 'JetBrainsMono Nerd Font'

config.warn_about_missing_glyphs = false
config.audible_bell = "Disabled"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0
}

config.automatically_reload_config = true

if get_appearance() == "Light" then
	config.color_scheme = get_theme()
end

return config

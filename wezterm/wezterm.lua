local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.keys = require "keys"
local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end

	return "Dark"
end

print(wezterm.target_triple)
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = {"pwsh.exe -NoLogo"}
end

config.initial_cols = 120
config.initial_rows = 28
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.hide_tab_bar_if_only_one_tab = true

config.warn_about_missing_glyphs = false
config.audible_bell = "Disabled"

config.automatically_reload_config = true
config.color_scheme = "Modus Vivendi"

if get_appearance() == "Light" then
	config.color_scheme = "Modus-Operandi"
end

return config

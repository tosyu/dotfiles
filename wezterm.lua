local wezterm = require "wezterm"
local config = wezterm.config_builder()

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end

	return "Dark"
end

config.initial_cols = 120
config.initial_rows = 28

config.warn_about_missing_glyphs = false

config.color_scheme = "Modus Vivendi"

if get_appearance() == "Light" then
	config.color_scheme = "Modus-Operandi"
end

return config

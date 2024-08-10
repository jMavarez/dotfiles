local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "tokyonight_night"
-- config.color_scheme = 'Tomorrow (light) (terminal.sexy)'
config.font = wezterm.font("JetBrains Mono")
config.font_size = 18.0
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config

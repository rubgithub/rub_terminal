local wezterm = require("wezterm")

local scheme = "Subliminal"
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]
local bg_custom = "#1a1b26"
local bg_color = scheme_def.background

local fg_inactive = "#565f89"
local bg_newtab = "#24283b"

function apply_theme(config)
	config.color_scheme = scheme
	config.colors = {
		-- overide background color
		background = bg_color,
		-- overide tab background color
		tab_bar = {
			active_tab = {
				bg_color = bg_color,
				fg_color = scheme_def.foreground,
			},
			-- overide tab inactive background color
			inactive_tab = {
				bg_color = bg_custom,
				fg_color = fg_inactive,
			},
			inactive_tab_edge = bg_custom,
			-- add custom new tab button background
			new_tab = {
				bg_color = bg_newtab,
				fg_color = scheme_def.foreground,
			},
		},
	}

	config.window_frame = {
		active_titlebar_bg = bg_color,
		inactive_titlebar_bg = bg_color,
	}
end

return {
	apply_theme = apply_theme,
}

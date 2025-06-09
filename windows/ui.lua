local wezterm = require("wezterm")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	-- Customize this string to what you want for the tab title
	local title = tab.active_pane.title
	-- Example: prepend the index of the tab
	local index = tab.tab_index + 1
	return "MyPc: " .. index
end)

function set_config(config)
	config.initial_cols = 135
	config.initial_rows = 27

	config.window_padding = {
		left = 5,
		right = 0,
		top = 0,
		bottom = 0,
	}

	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	config.window_background_opacity = 0.9
	config.show_tab_index_in_tab_bar = false
	config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
	--config.macos_window_background_blur = 20
	--SteadyBlock, BlinkingBlock, SteadyUnderline, BlinkingUnderline, SteadyBar, and BlinkingBar.
	config.default_cursor_style = "BlinkingUnderline"

	config.font = wezterm.font("JetBrains Mono")
end

return {
	set_config = set_config,
}

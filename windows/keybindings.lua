-- ~/.config/wezterm/config_parts/keybindings.lua

local wezterm = require("wezterm")
-- local act = wezterm.action
-- config.keys = {
--   { key = 'm', mods = 'ALT', action = wezterm.action.SendString 'cd /D/Projects/Go/Web\n' },
-- }
return {
	keys = {
		-- Open a new tab
		-- { key = 't', mods = 'CTRL', action = act.SpawnTab 'CurrentDirectory' },
		{
			key = "w",
			mods = "SHIFT|CTRL",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{ key = "Tab", mods = "SHIFT", action = wezterm.action.DisableDefaultAssignment },
		{
			key = "n",
			mods = "SHIFT|CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = "c",
			mods = "CTRL",
			action = wezterm.action_callback(function(window, pane)
				selection_text = window:get_selection_text_for_pane(pane)
				is_selection_active = string.len(selection_text) ~= 0
				if is_selection_active then
					window:perform_action(wezterm.action.CopyTo("ClipboardAndPrimarySelection"), pane)
				else
					window:perform_action(wezterm.action.SendKey({ key = "c", mods = "CTRL" }), pane)
				end
			end),
		},
		{
			key = "Tab",
			mods = "SHIFT",
			action = wezterm.action.DisableDefaultAssignment,
		},
	},

	-- Key table for leader key bindings
	key_tables = {
		leader_mode = {
			-- { key = "h", mods = "NONE", action = act.ActivatePaneDirection("Left") },
			-- { key = 'j', mods = 'NONE', action = act.ActivatePaneDirection 'Down' },
			-- { key = 'k', mods = 'NONE', action = act.ActivatePaneDirection 'Up' },
			-- { key = 'l', mods = 'NONE', action = act.ActivatePaneDirection 'Right' },
			-- { key = 't', mods = 'NONE', action = act.SpawnTab 'CurrentDirectory' },
			-- { key = 'w', mods = 'NONE', action = act.CloseCurrentTab { confirm = true }},
			-- { key = '-', mods = 'NONE', action = act.SplitVertical { domain = 'CurrentPaneDomain' }},
			-- { key = '\\', mods = 'NONE', action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' }},
			-- { key = 'z', mods = 'NONE', action = act.TogglePaneZoomState },
			-- After the leader key is pressed, revert to the default key table
			-- { key = '', mods = 'NONE', action = act.SetKeyTable { name = 'default' } },
		},
	},
}

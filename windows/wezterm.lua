local wezterm = require("wezterm")
-- local config = {}
local config = wezterm.config_builder()

config.default_prog = {
	"pwsh.exe",
	"-NoLogo",
	"-NoExit",
}

config.set_environment_variables = {
	-- cmd.exe
	-- prompt = '$E]7;file://localhost/$P$E\\$E[32m$T$E[0m $E[35m$P$E[36m$_$G$E[0m ',
}


-- #region set key config
local keybindings_config = dofile(wezterm.config_dir .. "//keybindings.lua")
if keybindings_config then
	config.keys = keybindings_config.keys
end
if keybindings_config.key_bindings then
	config.key_tables = keybindings_config.key_tables -- Load the key_tables as well
end
-- #endregion

--#region set ui config
local ui_module = dofile(wezterm.config_dir .. "//ui.lua")
if ui_module and ui_module.set_config then
	ui_module.set_config(config)
end
--#endregion

--#region set color scheme
local color_module = dofile(wezterm.config_dir .. "//color_scheme.lua")
if color_module and color_module.apply_theme then
	color_module.apply_theme(config)
end
--#endregion

return config

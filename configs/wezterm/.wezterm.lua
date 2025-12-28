local wezterm = require("wezterm")

return {
	-- enable_wayland = false,

	-- color_scheme = "Darcula",
	-- color_scheme = "Modified_gnome",
	font = wezterm.font({ family = "JetBrainsMono Nerd Font" }),
	font_size = 12,

	max_fps = 120,
	enable_tab_bar = false,
	-- window_decorations = "NONE",
	-- window_decorations = "RESIZE",
	-- window_background_opacity = 0.95,
	-- window_padding = { left = 5, right = 5, top = 5, bottom = 5 },
	harfbuzz_features = { "calt = 0", "clig = 0", "liga = 0" },
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = true,
	default_prog = { "powershell" },
	audible_bell = "Disabled",

	scrollback_lines = 5000,
	enable_scroll_bar = false,
	check_for_updates = false,
	default_cursor_style = "SteadyUnderline",

	disable_default_key_bindings = true,
	keys = {
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
		{ key = "`", mods = "ALT", action = wezterm.action.SpawnWindow },
		{ key = "`", mods = "ALT", action = wezterm.action.SpawnWindow },
	},
}

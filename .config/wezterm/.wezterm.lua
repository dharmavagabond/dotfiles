local wezterm = require("wezterm")
local act = wezterm.action

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Frappe"
	end
end

return {
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	enable_kitty_keyboard = true,
	font = wezterm.font({
		family = "CommitMono Nerd Font",
		harfbuzz_features = {
			"ss01=1", -- Ligatures <= != ===
			"ss02=1", -- Arrows >-> =>
			"ss03=1", -- Smart case (1:1) 2+3
			"ss04=1", -- Symbol spacing ... <<
			"ss05=1", -- Smart kerning (immi)
			"cv01=1", -- Alt. 'a'
			"cv02=1", -- Alt. 'g'
			"cv04=1", -- Alt. 'i'
			"cv07=1", -- Dotted 0
		},
	}),
	font_size = 12,
	freetype_load_target = "Normal",
	hide_tab_bar_if_only_one_tab = true,
	initial_cols = 115,
	initial_rows = 60,
	keys = {
		{
			key = "f",
			mods = "SHIFT|SUPER",
			action = act.ToggleFullScreen,
		},
	},
	line_height = 1.8,
	native_macos_fullscreen_mode = true,
	send_composed_key_when_left_alt_is_pressed = true,
	send_composed_key_when_right_alt_is_pressed = false,
	tab_bar_at_bottom = true,
	window_decorations = "RESIZE",
	window_background_opacity = 0.8,
	macos_window_background_blur = 30,
	window_padding = {
		left = 15,
		right = 10,
		top = 40,
		bottom = 0,
	},
}

-- # Control your input devices
-- # See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "intl",
		kb_options = "caps:internal",
		natural_scroll = true,
		repeat_delay = 250,
	},
	cursor = {
		default_monitor = "DP-1",
		no_hardware_cursors = 1,
	},
})

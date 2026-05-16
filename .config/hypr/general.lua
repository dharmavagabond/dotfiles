-- Sections
hl.config({
	general = {
		col = {
			inactive_border = 0x00000000,
			active_border = 0xffc4a7e7,
		},
		gaps_in = 2,
		gaps_out = 5,
		resize_on_border = true,
	},

	decoration = {
		rounding = 6,

		shadow = {
			enabled = false,
		},

		blur = {
			enabled = true,
			passes = 5,
		},
	},

	dwindle = {
		preserve_split = true,
	},

	layout = {
		single_window_aspect_ratio = { 4, 3 },
	},

	misc = {
		vrr = 3,
	},

	quirks = {
		prefer_hdr = 2,
	},

	render = {
		cm_auto_hdr = 0,
		direct_scanout = 2,
	},
})

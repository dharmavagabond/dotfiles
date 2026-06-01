-- Float and center
hl.window_rule({
	match = { tag = "floating-window" },
	size = { 845, 800 },
})
hl.window_rule({
	match = { class = "kitty.tui.float" },
	tag = "+floating-window",
})

-- Fullscreen
hl.window_rule({
	match = { class = "kitty.tui.fullscreen" },
	fullscreen = true,
	fullscreen_state = 2,
})

-- sigye
hl.window_rule({
	match = { title = "sigye", class = "kitty.tui.fullscreen" },
	workspace = 1,
})

-- clipse
hl.window_rule({
	match = { class = "clipse" },
	float = true,
	size = { 622, 652 },
})

-- mpv
hl.window_rule({
	match = { class = "mpv" },
	tag = "-floating-window",
	center = true,
	float = true,
	size = { 875, 600 },
})

-- localsend
hl.window_rule({
	match = { class = "localsend" },
	size = { 445, 700 },
})

-- Workspaces
hl.window_rule({
	match = { class = "(tidal-hifi|cliamp)" },
	workspace = 3,
})
hl.window_rule({
	match = { class = "(gamescope|com.libretro.RetroArch)" },
	workspace = 4,
})
hl.window_rule({
	match = { class = "(equibop|steam|streamlink-twitch-gui)" },
	workspace = 6,
})

-- Screen share
hl.window_rule({
	match = { title = ".*is sharing.*", workspace = "special silent" },
	tag = "+screen-share-indicator",
})

hl.window_rule({
	match = { tag = "screen-share-indicator" },
	float = true,
	border_size = 0,
	pin = true,
	move = { "monitor_w - window_w - 20", "monitor_h - window_h - 20" },
})

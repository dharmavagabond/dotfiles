-- # Float and center
hl.window_rule({
	match = { tag = "floating-window" },
	size = { 845, 800 },
})
hl.window_rule({
	match = { class = "kitty.tui.float" },
	tag = "+floating-window",
})

-- Clipse
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

-- # localsend
hl.window_rule({
	match = { class = "localsend" },
	size = { 445, 700 },
})

-- # Workspaces
hl.window_rule({
	match = { class = "(tidal-hifi|luna)" },
	workspace = 3,
})
hl.window_rule({
	match = { class = "gamescope" },
	workspace = 4,
})
hl.window_rule({
	match = { class = "(equibop|streamlink-twitch-gui|steam)" },
	workspace = 5,
})

-- Screen-sharing indicator - https://github.com/basecamp/omarchy/discussions/3052
hl.window_rule({
	match = { title = "^(.*is sharing.*\\.)$" },
	tag = "+screen-share-indicator",
})

hl.window_rule({
	match = { tag = "screen-share-indicator" },
	float = true,
	border_size = 0,
	pin = true,
	move = { "monitor_w - window_w - 20", "monitor_h - window_h - 20" },
})

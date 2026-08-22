----------
-- Tags --
----------
-- Default opacity
hl.window_rule({
	match = { tag = "default-opacity" },
	opacity = "0.9 0.9",
})

-- Float and center
hl.window_rule({
	match = { tag = "floating-window" },
	size = { 845, 800 },
	float = true,
	center = true,
})

-- Set opacity
hl.window_rule({
	match = { class = ".*" },
	tag = "+default-opacity",
})

-- Set floating-window
local floating_apps = {
	"kitty.tui.float",
	"dev.noctalia.Noctalia",
	"nm-connection-editor",
	"com.saivert.pwvucontrol",
	"blueberry.py",
	"com.github.ezrakhuzadi.BluetoothBitrateManager",
	"wiremix",
}

for _, app in ipairs(floating_apps) do
	hl.window_rule({
		match = { class = app },
		tag = "+floating-window",
	})
end

----------
-- Apps --
----------
-- TUI Fullscreen
hl.window_rule({
	match = { class = "kitty.tui.fullscreen" },
	fullscreen = true,
	fullscreen_state = 2,
})

-- sigye and matrix
hl.window_rule({
	match = { title = "^(sigye|matrix)$", class = "kitty.tui.fullscreen" },
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
	center = true,
	float = true,
})
hl.window_rule({
	match = {
		class = "mpv",
		workspace = "m[DP-1]",
	},
	size = { 1240, 698 },
})

-- localsend
hl.window_rule({
	match = { class = "localsend" },
	size = { 445, 700 },
	float = true,
	center = true,
})

-- RetroArch
hl.window_rule({
	match = { class = "com.libretro.RetroArch" },
	fullscreen = true,
	idle_inhibit = "fullscreen",
})

-- Gnome Calculator
hl.window_rule({
	match = { class = "org.gnome.Calculator" },
	float = true,
})

-- swayimg
hl.window_rule({
	match = { class = "swayimg" },
	float = true,
	center = true,
})
hl.window_rule({
	match = {
		class = "swayimg",
		workspace = "m[HDMI-A-1]",
	},
	size = { 845, 800 },
})
hl.window_rule({
	match = {
		class = "swayimg",
		workspace = "m[DP-1]",
	},
	size = { 1200, 800 },
})

-- Workspaces
hl.window_rule({
	match = { class = "^(tidal-hifi|cliamp)$" },
	workspace = 3,
})
local gaming_apps = {
	"gamescope",
	"com.libretro.RetroArch",
	"org.duckstation.DuckStation",
	"pcsx2 - qt",
	"dolphin - emu",
	"PPSSPPSDL",
	"Azahar",
}
for _, apps in ipairs(gaming_apps) do
	hl.window_rule({
		match = { class = apps },
		workspace = 4,
	})
end
hl.window_rule({
	match = { class = "^(equibop|steam|streamlink-twitch-gui)$" },
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

-- Restore opacity
local full_opacity_apps = {
	"swayimg",
	"mpv",
	"com.obsproject.Studio",
	"com.github.PintaProject.Pinta",
	"gimp",
	"org.gnome.Papers",
	"org.gnome.NautilusPreviewer",
}
for _, apps in ipairs(full_opacity_apps) do
	hl.window_rule({
		match = {
			class = apps,
		},
		tag = "-default-opacity",
		opacity = "1.0 0.9",
	})
end

-- Zen browser and webapps
hl.window_rule({
	match = {
		initial_title = "Zen Browser",
	},
	tag = "-default-opacity",
	opacity = "1.0 0.9",
})

-- Picture-in-Picture
hl.window_rule({
	match = { title = "(Picture.?in.?[Pp]icture)" },
	float = true,
	pin = true,
	size = { 600, 338 },
	keep_aspect_ratio = true,
	border_size = 0,
	opacity = "1 1",
	move = { "(monitor_w-window_w-40)", "(monitor_h*0.04)" },
})

-- Webcam overlay
hl.window_rule({
	match = { title = "WebcamOverlay" },
	float = true,
	pin = true,
	no_initial_focus = true,
	no_dim = true,
	move = { "(monitor_w-window_w-40)", "(monitor_h-window_h-40)" },
})

-- Suppress maximize
hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})

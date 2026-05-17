local tui = "app2unit -- kitty.desktop:tui "
local browser = io.popen("xdg-settings get default-web-browser"):read("*a"):gsub("\n", ""):gsub(".desktop$", "")

-- Close window
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Quit app" })

-- Tiling
hl.bind("SUPER + SLASH", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + SHIFT + SLASH", hl.dsp.exec_cmd("hypr-toggle-dwindle-aspect-ratio"))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

-- Fullscreen
hl.bind("SUPER + CTRL + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("SUPER + CTRL + ALT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))

-- Swap active window with the one next to it with mainMod + SHIFT + arrow keys
hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "d" }))

-- Toggle groups
hl.bind("SUPER + SHIFT + G", hl.dsp.window.move({ into_or_create_group = "r" }))
hl.bind("SUPER + CTRL + SHIFT + G", hl.dsp.window.move({ out_of_group = true }))

-- Join groups
hl.bind("SUPER + CTRL + SHIFT + H", hl.dsp.window.move({ into_group = "l" }))
hl.bind("SUPER + CTRL + SHIFT + L", hl.dsp.window.move({ into_group = "r" }))
hl.bind("SUPER + CTRL + SHIFT + K", hl.dsp.window.move({ into_group = "u" }))
hl.bind("SUPER + CTRL + SHIFT + J", hl.dsp.window.move({ into_group = "d" }))

-- Navigate a single set of grouped windows
hl.bind("SUPER + TAB", hl.dsp.window.cycle_next({ next = true, tiled = true }))
hl.bind("SUPER + SHIFT + TAB", hl.dsp.window.cycle_next({ prev = true, tiled = true }))

-- Launchers
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("pgrep -x fuzzel || fuzzel"))
hl.bind("SUPER + ALT + SPACE", hl.dsp.exec_cmd("omarchy-menu"))
hl.bind("XF86LaunchA", hl.dsp.exec_cmd("pgrep -x fuzzel || hyprworm"))
hl.bind("XF86LaunchB", hl.dsp.exec_cmd("ff"))

-- Application bindings
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd('app2unit-term --dir="$(omarchy-cmd-terminal-cwd)"'))
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("app2unit -- kitty.desktop:zellij"))
hl.bind("SUPER + A", hl.dsp.exec_cmd(tui .. "--title btop -- mise x -- btop"))
hl.bind(
	"SUPER + SHIFT + A",
	hl.dsp.exec_cmd('omarchy-launch-or-focus resources "app2unit -- net.nokyan.Resources.desktop"')
)
hl.bind(
	"SUPER + B",
	hl.dsp.exec_cmd(string.format("omarchy-launch-or-focus %s 'app2unit -- %s.desktop'", browser, browser))
)
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd(tui .. "--title browsh -- browsh"))
hl.bind("SUPER + C", hl.dsp.exec_cmd(tui .. "--title calcure -- calcure"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd(tui .. "--title cava -- cava"))
hl.bind("SUPER + D", hl.dsp.exec_cmd(tui .. "--title gdu -- mise x -- gdu"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd('omarchy-launch-or-focus equibop "app2unit -- equibop.desktop"'))
hl.bind("SUPER + F", hl.dsp.exec_cmd(tui .. "--title yazi -- mise x -- yazi"))
hl.bind("SUPER + G", hl.dsp.exec_cmd('omarchy-launch-or-focus github "app2unit -- GitHub.desktop"'))
hl.bind("SUPER + M", hl.dsp.exec_cmd('omarchy-launch-or-focus "Proton Mail" "app2unit -- proton-mail.desktop"'))
hl.bind("SUPER + N", hl.dsp.exec_cmd('omarchy-launch-or-focus nvim "app2unit -- nvim.desktop"'))
hl.bind("SUPER + P", hl.dsp.exec_cmd('omarchy-launch-or-focus "Proton Pass" "app2unit -- proton-pass.desktop"'))
hl.bind("SUPER + T", hl.dsp.exec_cmd('omarchy-launch-or-focus tidal-hifi "app2unit -- tidal-hifi.desktop"'))
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd('omarchy-launch-or-focus twitter "app2unit -- Twitter.desktop"'))
hl.bind("SUPER + W", hl.dsp.exec_cmd('omarchy-launch-or-focus whatsapp "app2unit -- WhatsApp.desktop"'))
hl.bind("SUPER + X", hl.dsp.exec_cmd(tui .. "--title clipse --class clipse -- clipse"))
hl.bind(
	"SUPER + SHIFT + X",
	hl.dsp.exec_cmd('clipse --clear-all && notify-send -a clipse -i kitty "Clipse" "Historial eliminado"')
)
hl.bind("SUPER + Y", hl.dsp.exec_cmd('omarchy-launch-or-focus youtube "app2unit -- YouTube.desktop"'))

-- Switch workspaces & move windows with mainMod + [0-9] and mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local keycode = 9 + i -- 10, 11, 12, ..., 19
	hl.bind("SUPER + code:" .. keycode, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + code:" .. keycode, hl.dsp.window.move({ workspace = i }))
	hl.bind("SUPER + CTRL + SHIFT + code:" .. keycode, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Resize active window
hl.bind("SUPER + minus", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + minus", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind("SUPER + equal", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + equal", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

-- Power menu controls lock, suspend, restart, shutdown
hl.bind("SUPER + ESCAPE", D.show_wlogout)

-- Notifications
hl.bind("SUPER + COMMA", hl.dsp.exec_cmd("swaync-client --close-latest"))
hl.bind("SUPER + SHIFT + COMMA", hl.dsp.exec_cmd("swaync-client --close-all"))
hl.bind("SUPER + CTRL + COMMA", hl.dsp.exec_cmd("swaync-client --toggle-dnd"))
hl.bind("SUPER + CTRL + SHIFT + COMMA", hl.dsp.exec_cmd("swaync-client --toggle-panel"))

-- Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("omarchy-capture-screenshot"), { description = "Screenshot" })

-- Screenrecord
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("omarchy-capture-screenrecording"), { description = "Screen record" })
hl.bind(
	"ALT + SHIFT + PRINT",
	hl.dsp.exec_cmd("omarchy-capture-screenrecording --with-desktop-audio"),
	{ description = "Screen record with audio" }
)

-- Color picker
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"), { description = "Color picker" })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brilloctl +"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brilloctl -"))

-- Volume
hl.bind("XF86AudioRaiseVolume", D.volume_ctl("speaker", "up"))
hl.bind("XF86AudioLowerVolume", D.volume_ctl("speaker", "down"))
hl.bind("XF86AudioMute", D.volume_ctl("speaker", "toggle-mute"))
hl.bind("XF86AudioMicMute", D.volume_ctl("microphone", "toggle-mute"))

-- Music
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))

-- Gaming Mode
hl.bind(
	"SUPER + SHIFT + S",
	hl.dsp.exec_cmd("app2unit -- kitty.desktop:tui-float gaming-start"),
	{ description = "Gamescope steam gaming mode" }
)
hl.bind(
	"SUPER + SHIFT + R",
	hl.dsp.exec_cmd("app2unit -- kitty.desktop:tui-float gaming-stop"),
	{ description = "Exit gaming mode" }
)

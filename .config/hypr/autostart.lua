hl.on("hyprland.start", function()
	hl.exec_cmd("app2unit -s b -t service -- awww-daemon")
	hl.exec_cmd("app2unit -s b -t service -- avizo-service")
	hl.exec_cmd("app2unit -s b -t service -- hyprdim --fade=70")
	hl.exec_cmd(
		"app2unit -s b -t service -- wl-clip-persist --clipboard regular --all-mime-type-regex '^(?!x-kde-passwordManagerHint).+'"
	)
	hl.exec_cmd("app2unit -s b -t service -- clipse -listen")
	hl.exec_cmd("app2unit -s s -t service -a polkit-gnome -- /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("app2unit -- hyprshade on vibrance")
end)

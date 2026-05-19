hl.on("hyprland.start", function()
	hl.exec_cmd("app2unit -- hyprshade on vibrance")
	hl.exec_cmd("app2unit -- hyprpm reload")
end)

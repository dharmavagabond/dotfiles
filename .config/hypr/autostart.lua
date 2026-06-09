hl.on("hyprland.start", function()
	hl.exec_cmd("sleep 1 && hyprpm reload")
	hl.exec_cmd("sleep 1 && hyprshade on vibrance")
end)

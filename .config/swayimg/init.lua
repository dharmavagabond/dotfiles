local viewer = swayimg.viewer
local gallery = swayimg.gallery

-- Viewer
--

viewer.on_key("q", function()
	swayimg.exit()
end)

viewer.text = {
	topleft = {},
	topright = {},
	bottomleft = {},
}

viewer.on_key("h", function()
	viewer.open("prev")
end)

viewer.on_key("l", function()
	viewer.open("next")
end)

viewer.on_key("j", function()
	local pos = swayimg.get_mouse_pos()
	local scale = viewer.scale
	scale = scale - scale / 10
	viewer.set_abs_scale(scale, pos.x, pos.y)
end)

viewer.on_key("k", function()
	local pos = swayimg.get_mouse_pos()
	local scale = viewer.scale
	scale = scale + scale / 10
	viewer.set_abs_scale(scale, pos.x, pos.y)
end)

-- Gallery
--

gallery.border_color = 0xffc4a7e7

gallery.text = {
	topleft = {},
	topright = {},
}

gallery.on_key("q", function()
	swayimg.exit()
end)

gallery.on_key("h", function()
	gallery.select("left")
end)

gallery.on_key("l", function()
	gallery.select("right")
end)

gallery.on_key("j", function()
	gallery.select("down")
end)

gallery.on_key("k", function()
	gallery.select("up")
end)

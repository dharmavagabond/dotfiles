local viewer = swayimg.viewer
local gallery = swayimg.gallery

-- Viewer
--

viewer.on_key("q", function()
	swayimg.exit()
end)

viewer.set_text("topleft", {})
viewer.set_text("topright", {})
viewer.set_text("bottomleft", {})

viewer.on_key("h", function()
	viewer.switch_image("prev")
end)

viewer.on_key("l", function()
	viewer.switch_image("next")
end)

viewer.on_key("j", function()
	local pos = swayimg.get_mouse_pos()
	local scale = viewer.get_scale()
	scale = scale - scale / 10
	viewer.set_abs_scale(scale, pos.x, pos.y)
end)

viewer.on_key("k", function()
	local pos = swayimg.get_mouse_pos()
	local scale = viewer.get_scale()
	scale = scale + scale / 10
	viewer.set_abs_scale(scale, pos.x, pos.y)
end)

-- Gallery
--

gallery.set_border_color(0xffc4a7e7)

gallery.set_text("topleft", {})

gallery.on_key("q", function()
	swayimg.exit()
end)

gallery.on_key("h", function()
	gallery.switch_image("left")
end)

gallery.on_key("l", function()
	gallery.switch_image("right")
end)

gallery.on_key("j", function()
	gallery.switch_image("down")
end)

gallery.on_key("k", function()
	gallery.switch_image("up")
end)

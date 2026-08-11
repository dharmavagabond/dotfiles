-- Reglas para layers
hl.layer_rule({
	match = { namespace = "launcher" },
	blur = true,
})

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
	},
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})

hl.layer_rule({
	match = { namespace = "logout_dialog" },
	blur = true,
	ignore_alpha = 0,
})

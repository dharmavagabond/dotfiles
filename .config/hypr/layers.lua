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
	no_anim = true,
	blur = true,
	blur_popups = true,
})

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+)$",
	},
	ignore_alpha = 0,
})

hl.layer_rule({
	match = { namespace = "logout_dialog" },
	blur = true,
})

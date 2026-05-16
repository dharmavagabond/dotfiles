-- Reglas para layers
hl.layer_rule({
	match = { namespace = "launcher" },
	blur = true,
})

hl.layer_rule({
	match = { namespace = "swaync-control-center" },
	blur = true,
	ignore_alpha = 0,
})
hl.layer_rule({
	match = { namespace = "swaync-notification-window" },
	blur = true,
	ignore_alpha = 0,
})

hl.layer_rule({
	match = { namespace = "wlogout" },
	blur = true,
	ignore_alpha = 0,
})

hl.layer_rule({
	match = { namespace = "logout_dialog" },
	blur = true,
	ignore_alpha = 0,
})

hl.layer_rule({
	match = { namespace = "avizo" },
	blur = true,
	ignore_alpha = 0,
})

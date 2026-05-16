for _, id in ipairs({ 1, 3 }) do
	hl.workspace_rule({ workspace = tostring(id), monitor = "HDMI-A-1", default = true })
end

for _, id in ipairs({ 2, 4, 5 }) do
	hl.workspace_rule({ workspace = tostring(id), monitor = "DP-1", default = true })
end

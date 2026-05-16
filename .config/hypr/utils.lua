D = D or {}

local gigabyte_id = nil

local function get_gigabyte_id()
	local monitors = hl.get_monitors()

	if not gigabyte_id then
		for _, monitor in ipairs(monitors) do
			if monitor.name == "DP-1" then
				gigabyte_id = monitor.id
				break
			end
		end
	end

	return gigabyte_id
end

function D.show_wlogout()
	return hl.dispatch(
		hl.dsp.exec_cmd(string.format("pgrep -x wlogout || app2unit -- wlogout -P %d -b 5", get_gigabyte_id()))
	)
end

function D.volume_ctl(type, action)
	local flag = ""

	if type == "speaker" then
		flag = (action == "up" or action == "down") and "-u" or ""
	elseif type == "microphone" then
		flag = "-m"
	end

	return function()
		local monitor = hl.get_active_monitor()
		local args = monitor and string.format("-M %s", monitor.id) or ""
		local cmd = string.format("volumectl %s %s %s", args, flag, action):gsub("%s+", " ")
		hl.dispatch(hl.dsp.exec_cmd(cmd))
	end
end

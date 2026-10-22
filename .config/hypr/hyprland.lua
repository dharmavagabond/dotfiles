local base = os.getenv("XDG_CONFIG_HOME") .. "/hypr"

local function load_dir(dir, prefix, skip)
	local handle = io.popen("ls -1 " .. dir .. " 2>/dev/null")

	if not handle then
		return
	end

	for entry in handle:lines() do
		if entry:match("%.lua$") and entry ~= skip then
			require((prefix or "") .. entry:gsub("%.lua$", ""))
		end
	end
	handle:close()
end

load_dir(base, nil, "hyprland.lua")
load_dir(base .. "/config", "config.")

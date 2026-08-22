local handle = io.popen("ls -1 " .. os.getenv("XDG_CONFIG_HOME") .. "/hypr/config/ 2>/dev/null")
if handle then
	for filename in handle:lines() do
		if filename ~= "init.lua" and filename:match("%.lua$") then
			require("hypr.config." .. filename:gsub("%.lua$", ""))
		end
	end

	handle:close()
end

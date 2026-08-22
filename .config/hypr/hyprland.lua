package.path = os.getenv("XDG_CONFIG_HOME") .. "/?.lua;"

-- Custom
require("hypr.animation")
require("hypr.autostart")
require("hypr.bindings")
require("hypr.config.init")
require("hypr.layers")
require("hypr.monitors")
require("hypr.windows")
require("hypr.workspaces")
require("hypr.permissions")

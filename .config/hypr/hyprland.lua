-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/

-- Omarchy defaults
package.path = os.getenv("XDG_CONFIG_HOME") .. "/?.lua;" .. os.getenv("OMARCHY_PATH") .. "/?.lua;" .. package.path

require("default.hypr.helpers")
require("default.hypr.envs")
require("default.hypr.looknfeel")
require("default.hypr.input")
require("default.hypr.windows")

-- Dynamic toggles
require("default.hypr.toggles")

-- Custom
require("hypr.utils")
require("hypr.animation")
require("hypr.autostart")
require("hypr.bindings")
require("hypr.general")
require("hypr.input")
require("hypr.layers")
require("hypr.monitors")
require("hypr.windows")
require("hypr.workspaces")

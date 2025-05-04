local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.enable_wayland = false
-- wezterm.dpi = 144

require("lua/keymaps").keys(config)
require("lua/ui").ui(config, "GruvboxDarkHard")

return config

local wezterm = require("wezterm")

local config = wezterm.config_builder()

if os.getenv("XDG_CURRENT_DESKTOP") == "Hyprland" then
	config.enable_wayland = false
	config.font_size = 20
else
	config.enable_wayland = true
end

require("lua/keymaps").keys(config)
require("lua/ui").ui(config, "tokyonight")

return config

local wezterm = require("wezterm")

local config = wezterm.config_builder()

require("lua/keymaps").keys(config)
require("lua/ui").ui(config, "tokyonight")

return config

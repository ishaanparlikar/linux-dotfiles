local wezterm = require("wezterm")

local module = {}

function module.keys(config)
	-- timeout_milliseconds defaults to 1000 and can be omitted
	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
	config.keys = {
		{
			key = "|",
			mods = "LEADER|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},

		-- tmux
		{
			key = "c",
			mods = "LEADER",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "x",
			mods = "LEADER",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},

		{
			key = "c",
			mods = "LEADER",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},

		{
			key = "c",
			mods = "LEADER",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "h",
			mods = "LEADER",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "LEADER",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "LEADER",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "LEADER",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
	}

	-- tab naviagation
	for i = 1, 8 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "ALT",
			action = wezterm.action.ActivateTab(i - 1),
		})
	end
end

return module

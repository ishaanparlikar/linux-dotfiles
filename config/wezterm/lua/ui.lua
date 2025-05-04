local wezterm = require("wezterm")

local module = {}

function module.ui(config, colorscheme)
	config.automatically_reload_config = true
	config.window_close_confirmation = "NeverPrompt"
	-- config.window_decorations = "RESIZE"
	config.color_scheme = colorscheme
	config.window_background_opacity = 0.97

	config.window_frame = {}
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false

	config.window_padding = {
		left = "1cell",
		right = "1cell",
		top = "0.5cell",
		bottom = "0.5cell",
	}
	-- font
	config.font =
		wezterm.font("MonaspiceNe Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" }) -- (AKA: MonaspiceNe NFM) /usr/local/share/fonts/m/MonaspiceNeNerdFontMono_Regular.otf, FontConfig

	config.font_rules = {
		-- Bold-and-italic
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font({
				family = "MonaspiceRn Nerd Font Mono",
				style = "Italic",
				weight = "Medium",
			}),
		},
	}

	wezterm.on("update-right-status", function(window, _)
		local SOLID_LEFT_ARROW = ""
		local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
		local prefix = ""

		if window:leader_is_active() then
			prefix = " " .. utf8.char(0x1f30a) -- ocean wave
			SOLID_LEFT_ARROW = utf8.char(0xe0b2)
		end

		if window:active_tab():tab_id() ~= 0 then
			ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
		end -- arrow color based on if tab is first pane

		window:set_left_status(wezterm.format({
			{ Background = { Color = "#b7bdf8" } },
			{ Text = prefix },
			ARROW_FOREGROUND,
			{ Text = SOLID_LEFT_ARROW },
		}))
	end)
end
return module

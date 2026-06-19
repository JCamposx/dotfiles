local wezterm = require("wezterm")

return {
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = true,
	disable_default_key_bindings = true,
	keys = {
		-- Clipboard
		{
			key = "c",
			mods = "CMD",
			action = wezterm.action.CopyTo("Clipboard"),
		},
		{
			key = "v",
			mods = "CMD",
			action = wezterm.action.PasteFrom("Clipboard"),
		},

		-- Window / Tab spawn
		{
			key = "n",
			mods = "CMD",
			action = wezterm.action.SpawnWindow,
		},
		{
			key = "t",
			mods = "CMD",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},

		-- Font size
		{
			key = "-",
			mods = "CMD",
			action = wezterm.action.DecreaseFontSize,
		},
		{
			key = "=",
			mods = "CMD",
			action = wezterm.action.IncreaseFontSize,
		},
		{
			key = "0",
			mods = "CMD",
			action = wezterm.action.ResetFontSize,
		},

		-- Close tab
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentTab({ confirm = true }),
		},

		-- Rename tab
		{
			key = "R",
			mods = "CMD|SHIFT",
			action = wezterm.action.PromptInputLine({
				description = "Rename tab",
				action = wezterm.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},

		-- Navigate between tabs
		{
			key = "Tab",
			mods = "CTRL",
			action = wezterm.action.ActivateTabRelative(1),
		},
		{
			key = "Tab",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateTabRelative(-1),
		},

		-- Move tabs
		{
			key = "]",
			mods = "CMD|SHIFT",
			action = wezterm.action.MoveTabRelative(1),
		},
		{
			key = "[",
			mods = "CMD|SHIFT",
			action = wezterm.action.MoveTabRelative(-1),
		},

		-- Reload configuration
		{
			key = "r",
			mods = "CMD",
			action = wezterm.action.ReloadConfiguration,
		},

		-- Quit application
		{
			key = "q",
			mods = "CMD",
			action = wezterm.action.QuitApplication,
		},

		-- Zoom pane
		{
			key = "z",
			mods = "CMD|SHIFT",
			action = wezterm.action.TogglePaneZoomState,
		},

		-- Navigate between panes
		{
			key = "h",
			mods = "CMD",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "j",
			mods = "CMD",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			key = "k",
			mods = "CMD",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "l",
			mods = "CMD",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},

		-- Choose pane
		{
			key = "p",
			mods = "CMD",
			action = wezterm.action.PaneSelect,
		},

		-- Split pane
		{
			key = "h",
			mods = "CMD|ALT",
			action = wezterm.action.SplitPane({
				direction = "Left",
				size = { Percent = 50 },
			}),
		},
		{
			key = "j",
			mods = "CMD|ALT",
			action = wezterm.action.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "k",
			mods = "CMD|ALT",
			action = wezterm.action.SplitPane({
				direction = "Up",
				size = { Percent = 50 },
			}),
		},
		{
			key = "l",
			mods = "CMD|ALT",
			action = wezterm.action.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},

		-- Rotate panes
		{
			key = "h",
			mods = "CMD|SHIFT",
			action = wezterm.action.RotatePanes("CounterClockwise"),
		},
		{
			key = "j",
			mods = "CMD|SHIFT",
			action = wezterm.action.RotatePanes("Clockwise"),
		},
		{
			key = "k",
			mods = "CMD|SHIFT",
			action = wezterm.action.RotatePanes("CounterClockwise"),
		},
		{
			key = "l",
			mods = "CMD|SHIFT",
			action = wezterm.action.RotatePanes("Clockwise"),
		},

		-- Resize pane
		{
			key = "h",
			mods = "CMD|CTRL",
			action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
		},
		{
			key = "j",
			mods = "CMD|CTRL",
			action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
		},
		{
			key = "k",
			mods = "CMD|CTRL",
			action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
		},
		{
			key = "l",
			mods = "CMD|CTRL",
			action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
		},

		-- Close pane
		{
			key = "d",
			mods = "CMD|SHIFT",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
	},
}

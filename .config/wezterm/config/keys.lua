local wezterm = require("wezterm")

local function activate_tab_by_number_keys()
	local keys = {}
	for i = 1, 8 do
		table.insert(keys, {
			key = tostring(i),
			mods = "CMD",
			action = wezterm.action.ActivateTab(i - 1),
		})
	end
	table.insert(keys, {
		key = "9",
		mods = "CMD",
		action = wezterm.action.ActivateTab(-1),
	})
	return keys
end

local function rotate_panes_follow_focus(direction)
	return wezterm.action_callback(function(window, pane)
		local tab = window:active_tab()
		local pane_id = pane:pane_id()
		window:perform_action(wezterm.action.RotatePanes(direction), pane)
		for _, info in ipairs(tab:panes_with_info()) do
			if info.pane:pane_id() == pane_id then
				window:perform_action(wezterm.action.ActivatePaneByIndex(info.index), pane)
				return
			end
		end
		wezterm.log_warn("rotate_panes: original pane not found after rotation")
	end)
end

local config = {
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
			action = rotate_panes_follow_focus("CounterClockwise"),
		},
		{
			key = "j",
			mods = "CMD|SHIFT",
			action = rotate_panes_follow_focus("Clockwise"),
		},
		{
			key = "k",
			mods = "CMD|SHIFT",
			action = rotate_panes_follow_focus("CounterClockwise"),
		},
		{
			key = "l",
			mods = "CMD|SHIFT",
			action = rotate_panes_follow_focus("Clockwise"),
		},

		-- Resize pane
		{
			key = "h",
			mods = "CMD|CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Left", 3 }),
		},
		{
			key = "j",
			mods = "CMD|CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Down", 3 }),
		},
		{
			key = "k",
			mods = "CMD|CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Up", 3 }),
		},
		{
			key = "l",
			mods = "CMD|CTRL|SHIFT",
			action = wezterm.action.AdjustPaneSize({ "Right", 3 }),
		},

		-- Close pane
		{
			key = "d",
			mods = "CMD|SHIFT",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
	},
}

-- Append the generated number-key bindings to the static keys table.
for _, key in ipairs(activate_tab_by_number_keys()) do
	table.insert(config.keys, key)
end

return config

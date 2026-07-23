local wezterm = require("wezterm")
local act = wezterm.action

-- Status bar indicator
wezterm.on("update-right-status", function(window, _)
	local name = window:active_key_table()
	if name then
		name = "  " .. name:upper() .. "  "
	elseif window:leader_is_active() then
		name = "  LEADER  "
	end
	window:set_right_status(name or "")
end)

-- Rotate panes and keep focus on the originally-focused pane
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

-- Tab number bindings (1-9, 0 = last)
local function tab_number_keys()
	local keys = {}
	for i = 1, 9 do
		table.insert(keys, {
			key = tostring(i),
			mods = "LEADER",
			action = wezterm.action.ActivateTab(i - 1),
		})
	end
	table.insert(keys, {
		key = "0",
		mods = "LEADER",
		action = wezterm.action.ActivateTab(-1),
	})
	return keys
end

-- Key bindings
local keys = {
	-- Clipboard
	{ key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },

	-- Window spawn
	{ key = "n", mods = "CMD", action = act.SpawnCommandInNewWindow({ cwd = wezterm.home_dir }) },

	-- Font size
	{ key = "-", mods = "CMD", action = act.DecreaseFontSize },
	{ key = "=", mods = "CMD", action = act.IncreaseFontSize },
	{ key = "0", mods = "CMD", action = act.ResetFontSize },

	-- Quit
	{ key = "q", mods = "CMD", action = act.QuitApplication },

	-- Resize mode
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
			until_unknown = true,
		}),
	},

	-- Split mode
	{
		key = "s",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "split_pane",
			one_shot = true,
			until_unknown = true,
		}),
	},

	-- Close pane
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	},

	-- Close tab
	{
		key = "X",
		mods = "LEADER",
		action = act.CloseCurrentTab({ confirm = true }),
	},

	-- Toggle pane zoom
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

	-- Pane select by number
	{ key = "p", mods = "LEADER", action = act.PaneSelect },

	-- Rotate prev / next pane
	{
		key = "{",
		mods = "LEADER",
		action = rotate_panes_follow_focus("CounterClockwise"),
	},
	{
		key = "}",
		mods = "LEADER",
		action = rotate_panes_follow_focus("Clockwise"),
	},

	-- Copy mode
	{ key = "[", mods = "LEADER", action = act.ActivateCopyMode },

	-- Navigate panes
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

	-- Tab navigation
	{ key = ".", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = ",", mods = "LEADER", action = act.ActivateTabRelative(-1) },

	-- New tab
	{ key = "t", mods = "LEADER", action = act.SpawnCommandInNewTab({ cwd = wezterm.home_dir }) },

	-- Rename tab
	{
		key = "T",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Rename tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

-- Append tab number bindings (LEADER+1-9, LEADER+0)
for _, key in ipairs(tab_number_keys()) do
	table.insert(keys, key)
end

-- Key Tables (modal layers)
local key_tables = {
	resize_pane = {
		-- Resize in small step
		{ key = "h", action = act.AdjustPaneSize({ "Left", 3 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 3 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 3 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 3 }) },
		-- Resize in large step
		{ key = "H", action = act.AdjustPaneSize({ "Left", 10 }) },
		{ key = "J", action = act.AdjustPaneSize({ "Down", 10 }) },
		{ key = "K", action = act.AdjustPaneSize({ "Up", 10 }) },
		{ key = "L", action = act.AdjustPaneSize({ "Right", 10 }) },
		-- Exit mode
		{ key = "Escape", action = "PopKeyTable" },
	},
	split_pane = {
		-- Split
		{ key = "h", action = act.SplitPane({ direction = "Left", size = { Percent = 50 } }) },
		{ key = "j", action = act.SplitPane({ direction = "Down", size = { Percent = 50 } }) },
		{ key = "k", action = act.SplitPane({ direction = "Up", size = { Percent = 50 } }) },
		{ key = "l", action = act.SplitPane({ direction = "Right", size = { Percent = 50 } }) },
	},
}

return {
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = true,
	disable_default_key_bindings = true,
	leader = { key = "b", mods = "CTRL" },
	keys = keys,
	key_tables = key_tables,
}

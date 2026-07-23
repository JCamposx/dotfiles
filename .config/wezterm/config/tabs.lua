local wezterm = require("wezterm")
local palette = require("colors").palette

local SEP = wezterm.nerdfonts.pl_left_soft_divider
local SEP_WIDTH = 1
local PADDING = 2
local ELLIPSIS = "…"
local ELLIPSIS_WIDTH = 1

-- Returns the explicit tab title if set, otherwise falls back to the active pane title
local function tab_title(tab)
	local title = tab.tab_title
	if title and #title > 0 then
		return title
	end
	return tab.active_pane.title
end

wezterm.on("format-tab-title", function(tab, _, _, _, _, max_width)
	local foreground = palette.fg

	if tab.is_active then
		foreground = palette.blue
	end

	local title = tab_title(tab)

	-- Tab index prefix (1-based, like tmux's status bar)
	title = tostring(tab.tab_index + 1) .. ": " .. title

	local max_title = max_width - PADDING - SEP_WIDTH
	if wezterm.column_width(title) > max_title then
		title = wezterm.truncate_right(title, max_title - ELLIPSIS_WIDTH) .. ELLIPSIS
	end

	title = " " .. title .. " "

	return {
		{ Background = { Color = palette.bg } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Foreground = { Color = palette.fg } },
		{ Text = SEP },
	}
end)

return {
	use_fancy_tab_bar = false,
	tab_max_width = 64,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = true,
	show_new_tab_button_in_tab_bar = false,
}

local M = require("colors.onedark")

return {
	colors = {
		foreground = M.fg,
		background = M.bg,

		cursor_bg = M.cursor,
		cursor_fg = M.bg,
		cursor_border = M.cursor,

		selection_fg = M.selection_fg,
		selection_bg = M.selection_bg,

		scrollbar_thumb = M.bg,
		split = M.bright_black,

		ansi = {
			M.black,
			M.red,
			M.green,
			M.yellow,
			M.blue,
			M.magenta,
			M.cyan,
			M.white,
		},

		brights = {
			M.bright_black,
			M.bright_red,
			M.bright_green,
			M.bright_yellow,
			M.bright_blue,
			M.bright_magenta,
			M.bright_cyan,
			M.bright_white,
		},

		tab_bar = {
			active_tab = {
				bg_color = M.blue,
				fg_color = M.bg,
			},
			inactive_tab = {
				bg_color = M.bg,
				fg_color = M.blue,
			},
			inactive_tab_edge = M.blue,
		},
	},
}

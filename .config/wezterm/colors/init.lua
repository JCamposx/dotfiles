local theme = require("colors.onedark")
local M = setmetatable({ bg = "#111318" }, { __index = theme })

return {
	palette = M,

	colors = {
		foreground = M.fg,
		background = M.bg,

		cursor_border = M.fg,

		selection_fg = M.fg,
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
			background = M.bg,
		},
	},
}

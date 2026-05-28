local table = require("utils.table")

local colors = require("colorscheme")
local font = require("config.font")
local ui = require("config.ui")
local window = require("config.window")
local keys = require("config.keys")

local config = table.merge(colors, font, ui, window, keys)

return config

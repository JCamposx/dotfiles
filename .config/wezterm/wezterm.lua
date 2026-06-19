local table = require("utils.table")

local colors = require("colors")
local font = require("config.font")
local terminal = require("config.terminal")
local window = require("config.window")
local keys = require("config.keys")
local tabs = require("config.tabs")

local config = table.merge({ colors = colors.colors }, font, terminal, window, keys, tabs)

return config

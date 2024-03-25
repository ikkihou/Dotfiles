local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local wechat = sbar.add("item", "wechat", {
	position = "right",
	icon = {
		font = {
			style = settings.font.style_map["Regular"],
			size = 19.0,
		},
	},
})

local sbar = require("sketchybar")
local settings = require("settings")
local colors = require("colors")

local input_method = sbar.add("item", "input_method", {
	position = "right",
	update_freq = 1,
    padding_right = 8,
	script = "$CONFIG_DIR/plugins/input_method.sh",
	background = {
		height = 22,
		color = { alpha = 0 },
		border_color = { alpha = 0 },
		drawing = true,
	},
	icon = {
		font = "sketchybar-app-font:Regular:16.0",
		align = "center",
		width = 20,
	},
	label = {
		drawing = false,
	},
})

sbar.add("bracket", "input_method.bracket", { input_method.name }, {
	background = { color = colors.with_alpha(colors.black, 0.7), border_color = colors.transparent },
})

sbar.add("item", "input_method.padding", {
	position = "right",
	width = settings.group_paddings,
})

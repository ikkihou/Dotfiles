local colors = require("colors")
local sbar = require("sketchybar")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "everything",
	height = 40,
	color = colors.bar.bg,
	padding_right = 0,
	padding_left = 0,
})

local colors = require("colors")
local settings = require("settings")

local function turn_dark_mode_on()
	sbar.exec("osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to true'")
end

local function turn_dark_mode_off()
	sbar.exec(
		"osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"
	)
end

sbar.add("item", "dark_mode_switch", {
	position = "right",
})

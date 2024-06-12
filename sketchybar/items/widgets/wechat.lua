local colors = require("colors")
local settings = require("settings")

local wechat = sbar.add("item", "WeChat", {
	position = "right",
	update_freq = 1,
	background = {
		height = 22,
		color = { alpha = 0 },
		border_color = { alpha = 0 },
		drawing = true,
	},
	icon = {
		font = "sketchybar-app-font:Regular:18.0",
		string = settings.icons["微信"],
	},
	label = {
		drawing = false,
	},
})

sbar.add("bracket", "widget.wechat.bracket", { wechat.name }, {
	background = { color = colors.with_alpha(colors.black, 0.7), border_color = colors.transparent },
})

wechat:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a WeChat")
end)

wechat:subscribe("routine", function()
	local command =
		'lsappinfo -all list | grep WeChat | egrep -o \'"StatusLabel"=\\{ "label"="?(.*?)"? \\}\' | sed \'s/\\"StatusLabel\\"={ \\"label\\"=\\(.*\\) }/\\1/g\''

	sbar.exec(command, function(statusLabel)
		statusLabel = statusLabel:gsub('"', "") -- string

		if statusLabel ~= nil then
			local icon_color
			local new_label

			if tonumber(statusLabel) ~= nil then
				icon_color = colors.green
				new_label = statusLabel
			else
				new_label = ""
			end

			if new_label == "" then
				wechat:set({
					icon = { color = colors.white },
					label = {
						drawing = false,
					},
				})
				return
			elseif new_label ~= "" then
				wechat:set({
					drawing = true,
					icon = { color = icon_color, padding_right = 2 },
					label = { string = new_label, padding_right = 5, padding_left = 3, y_offset = 1, drawing = true },
				})
				return
			else
				return
			end
		end
	end)
end)
